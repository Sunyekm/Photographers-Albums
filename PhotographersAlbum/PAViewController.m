//
//  PAViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "PAViewController.h"

@interface PAViewController ()

@end

@implementation PAViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.isEditable = NO;
    
    self.albums = [[AlbumCollection alloc] init];
    
    self.albumCollectionView.backgroundColor = [UIColor blackColor];
    
    [self loadDatabase];
    
    [self reloadUI];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self reloadUI];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) databasePath
{
    if (!_databasePath)
    {
        
        _databasePath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"AlbumDatabase.plist"];
    }
    return  _databasePath;
}

- (NSMutableArray *) selectedAlbums
{
    if (!_selectedAlbums)
    {
        _selectedAlbums = [[NSMutableArray alloc] init];
    }
    return _selectedAlbums;
}


//Data persistence -------------------------- TO BE TESTED //////////////////////
- (void) loadObjectFromDatabase
{
    int numberOfAlbums = [self.albumDatabase count];
    for (int i=0; i<numberOfAlbums; i++) {
        NSMutableDictionary *album = [self.albumDatabase objectForKey:[NSString stringWithFormat:@"%d",i]];
        
        NSString *albumTitle = [album objectForKey:@"ALBUM_TITLE"];
        int indexOfCoverPhoto = (int) [album objectForKey:@"COVER_PHOTO"];
        
        NSMutableDictionary *photos = [album objectForKey:@"PHOTOS"];
        
        
        [self.albums createAlbum:albumTitle];
        
        
        
        
        
        int numberOfPhotos = [photos count];
        
        
        
        for (int j=0; j<numberOfPhotos; j++)
        {
            Album *album = [self.albums.albums objectAtIndex:i];
            
            Photo *photo = [[Photo alloc] init];
            
            NSMutableDictionary *photoDatabase = [photos objectForKey:[NSString stringWithFormat:@"%d",j]];
            
            photo.imageUrl = [photoDatabase objectForKey:@"PHOTO_URL"];
            photo.title = [photoDatabase objectForKey:@"PHOTO_TITLE"];
            photo.imageThumbnailUrl = [photoDatabase objectForKey:@"THUMBNAIL_URL"];
            if ([[photoDatabase objectForKey:@"IS_LOCAL_FILE"] isEqualToString:@"YES"])
            {
                photo.isLocalFile = YES;
            }
            else
            {
                photo.isLocalFile = NO;
            }
            [album addPhoto:photo];
            
            if (j == indexOfCoverPhoto) album.coverPhoto = photo;
        }
    }
}

- (void) saveObjecttoDatabase
{
    if (!self.albumDatabase)
    {
        self.albumDatabase = [[NSMutableDictionary alloc] init];
    }
    
    int numberOfAlbums = [self.albums countAlbums];
    
    
    
    for (int i=0; i<numberOfAlbums; i++)
    {
        Album *album = [self.albums.albums objectAtIndex:i];
        
        NSMutableDictionary *albumInDatabase = [[NSMutableDictionary alloc] init];
        
        
        [albumInDatabase setObject:album.title forKey:@"ALBUM_TITLE"];
        
        
        
        
        [self.albumDatabase setObject:albumInDatabase forKey:[NSString stringWithFormat:@"%d",i]];
        
        
        
        NSMutableDictionary *photosInDatabase = [[NSMutableDictionary alloc] init];
        [albumInDatabase setObject:photosInDatabase forKey:@"PHOTOS"];
        
        int indexOfCoverPhoto = [album.photos indexOfObject:album.coverPhoto];
        [albumInDatabase setObject:[NSString stringWithFormat:@"%d",indexOfCoverPhoto] forKey:@"COVER_PHOTO"];
        
        
        int numberOfPhots = [album.photos count];
        for (int j=0; j<numberOfPhots; j++)
        {
            Photo *photo = [album.photos objectAtIndex:j];
            
            
            
            NSMutableDictionary *photoInDatabase = [[NSMutableDictionary alloc] init];
            
            [photoInDatabase setObject:photo.title forKey:@"PHOTO_TITLE"];
            [photoInDatabase setObject:photo.imageUrl forKey:@"PHOTO_URL"];
            [photoInDatabase setObject:photo.imageThumbnailUrl forKey:@"THUMBNAIL_URL"];
            
            if (photo.isLocalFile)
            {
                [photoInDatabase setObject:@"YES" forKey:@"IS_LOCAL_FILE"];
            }
            else
            {
                [photoInDatabase setObject:@"NO" forKey:@"IS_LOCAL_FILE"];
            }
            
            [photosInDatabase setObject:photoInDatabase forKey:[NSString stringWithFormat:@"%d",j]];
            
            
            
        }
        
    }
}

- (void) loadDatabase
{
    
    BOOL success = [[NSFileManager defaultManager] fileExistsAtPath:self.databasePath];
    
    
    if (success)
    {
        self.albumDatabase = [[NSMutableDictionary alloc] initWithContentsOfFile:self.databasePath];
    }
    else
    {
        self.albumDatabase = [[NSMutableDictionary alloc] init];
    }
    
    [self loadObjectFromDatabase];
    
}

- (void) writeDatabase
{
    if ([self.albums.albums count] > 0)
    {
        [self.albumDatabase removeAllObjects];
        
        [self saveObjecttoDatabase];
        
        [self.albumDatabase writeToFile:self.databasePath atomically:YES];
        
    }
    
    
    //NSLog([self.albumDatabase description]);
    
}
//Data persistence -------------------------- TO BE TESTED /////////////////////////////////



//Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    
    if ([[segue identifier] isEqualToString:@"CreateNewAlbum"])
    {
        // Get reference to the destination view controller
        AddAlbumViewController *addAlbumVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here
        addAlbumVC.albums = self.albums;
        addAlbumVC.delegate = self;
    }
     
    
    
    if ([[segue identifier] isEqualToString:@"PushAlbumView"])
    {
        
        AlbumViewController *albumVC = [segue destinationViewController];
        
        NSIndexPath *selectedItemIndex = [[self.albumCollectionView indexPathsForSelectedItems] objectAtIndex:0] ;
        
        albumVC.album = [self.albums.albums objectAtIndex:selectedItemIndex.item];
        
        
        albumVC.delegate = self;
        
    }
}

 



- (IBAction)removeAlbumButtonTapped:(UIBarButtonItem *)sender
{
    
    
    if (!self.isEditable)
    {
        
        self.settingButton.enabled = NO;
        self.addNewAlbumButton.enabled = NO;
        self.helpButton.enabled = NO;
        self.removeAlbumButton.title = @"Done";
        [self.albumCollectionView setAllowsMultipleSelection:YES];
        
        
        
    }
    else
    {
        
        if ([self.selectedAlbums count] >0)
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Remove Albums"
                                  message:@"Are you sure you want to remove these Albums?"
                                  delegate:self
                                  cancelButtonTitle:@"Remove"
                                  otherButtonTitles:@"Cancel", nil];
            
            [alert show];
        
        }
        else
        {
            [self.albumCollectionView setAllowsMultipleSelection:NO];
            self.settingButton.enabled = YES;
            self.addNewAlbumButton.enabled = YES;
            self.helpButton.enabled = YES;
            self.removeAlbumButton.title = @"Remove Album";
            [self.selectedAlbums removeAllObjects];
            [self reloadUI];
        }
        
        
        
        
        
        
        
    }
    
    self.isEditable = !self.isEditable;
}

-(void) reloadUI
{
    
    for(NSIndexPath *indexPath in self.albumCollectionView.indexPathsForSelectedItems)
    {
        
        [self.albumCollectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    [self.albumCollectionView reloadData];
    
    [self writeDatabase];
    
     
    
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [self.albums countAlbums];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PAAlbumCoverCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor whiteColor];
    Album *album =[self.albums.albums objectAtIndex:indexPath.item];
    cell.albumTitleLabel.text = album.title;
    
    
    cell.coverPhoto.layer.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    cell.coverPhoto.layer.borderWidth = 5.0;
    cell.coverPhoto.layer.shadowOffset = CGSizeMake(0, 3);
    cell.coverPhoto.layer.shadowOpacity = 0.7;
    cell.coverPhoto.layer.shouldRasterize = YES;
    cell.coverPhoto.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
    
    if (album.coverPhoto)
    {
        
        cell.coverPhoto.image =  album.coverPhoto.thumbnail;
        
    }
    
    
    
    

    album = nil;
    
    
    
    
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isEditable)
    {
        [self performSegueWithIdentifier:@"PushAlbumView"
                                  sender:self];
        [self.albumCollectionView
         deselectItemAtIndexPath:indexPath animated:YES];
    }
    else
    {
        [self.selectedAlbums addObject:[self.albums.albums objectAtIndex:indexPath.item]];
        
    }
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
    if (self.isEditable)
    {
        [self.selectedAlbums removeObject:[self.albums.albums objectAtIndex:indexPath.item]];
        
    }
}


#pragma mark - AddAlbumViewControllerDelegate
- (void)AddAlbumViewControllerFinished
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self reloadUI];
}

#pragma mark - AlbumViewControllerDelegate
-(void) writeAlbumsToDatabase
{
    [self reloadUI];
}


#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    if (buttonIndex == 0)
        
    {
        for (Album *album in self.selectedAlbums)
        {
            [self.albums.albums removeObject:album];
        }
        
        
        
        
        
                
        
        
        
    }
    else
    {
        NSArray *indexes = [self.albumCollectionView indexPathsForSelectedItems];
        
        for (int i =0; i < [indexes count]; i++)
        {
            
            [self.albumCollectionView deselectItemAtIndexPath:indexes[i] animated:YES];
        }
        
        
        
        
    }


    [self.albumCollectionView setAllowsMultipleSelection:NO];
    self.settingButton.enabled = YES;
    self.addNewAlbumButton.enabled = YES;
    self.helpButton.enabled = YES;
    self.removeAlbumButton.title = @"Remove Album";
    [self.selectedAlbums removeAllObjects];
    [self reloadUI];

}


@end
