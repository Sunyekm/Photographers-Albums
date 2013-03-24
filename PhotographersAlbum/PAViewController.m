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

- (NSMutableArray *) selectedAlbums
{
    if (!_selectedAlbums)
    {
        _selectedAlbums = [[NSMutableArray alloc] init];
    }
    return _selectedAlbums;
}




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

 

- (IBAction)tempHelp:(id)sender
{
    
    [self reloadUI];
}

- (IBAction)removeAlbumButtonTapped:(UIBarButtonItem *)sender
{
    UIBarButtonItem *button = sender;
    
    if (!self.isEditable)
    {
        self.isEditable = YES;
        self.settingButton.enabled = NO;
        self.addNewAlbumButton.enabled = NO;
        self.helpButton.enabled = NO;
        button.title = @"Done";
        [self.albumCollectionView setAllowsMultipleSelection:YES];
        
    }
    else
    {
        self.isEditable = NO;
        self.settingButton.enabled = YES;
        self.addNewAlbumButton.enabled = YES;
        self.helpButton.enabled = YES;
        UIBarButtonItem *button = sender;
        button.title = @"Remove Album";
        
        for (Album *album in self.selectedAlbums)
        {
            [self.albums.albums removeObject:album];
        }
        
        [self.selectedAlbums removeAllObjects];
        
        [self.albumCollectionView setAllowsMultipleSelection:NO];
        
        [self reloadUI];
    }
}

-(void) reloadUI
{
    
    [self.albumCollectionView reloadData];
    
    
    
     
    for(NSIndexPath *indexPath in self.albumCollectionView.indexPathsForSelectedItems)
    {
        
        [self.albumCollectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
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
    
    
    if (album.coverPhoto)
    {
        
        cell.coverPhoto.image =  album.coverPhoto.thumbnail;
        
    }
    
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
    
@end
