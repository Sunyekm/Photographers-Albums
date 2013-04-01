//
//  AlbumViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-15.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "AlbumViewController.h"


@interface AlbumViewController ()

@end

@implementation AlbumViewController

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
    
    self.photoCollectionView.backgroundColor = [UIColor blackColor];
    self.albumBar.topItem.title = self.album.title;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *) selectedPhotosToRemove
{
    if (!_selectedPhotosToRemove) {
        _selectedPhotosToRemove = [[NSMutableArray alloc] init];
    }
    return _selectedPhotosToRemove;
}

- (IBAction)removePhotoButtonTapped:(UIBarButtonItem *)sender
{
    
    
    
    
    
    if (!self.isEditable)
    {
        
        self.addPhotoButton.enabled = NO;
        self.addInternetPhotoButton.enabled = NO;
        self.renameButton.enabled = NO;
        self.removePhotoButton.title = @"Done";
        [self.photoCollectionView setAllowsMultipleSelection:YES];
        
        
        
    }
    else
    {
        
        if ([self.selectedPhotosToRemove count] >0)
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Remove Photos"
                                  message:@"Are you sure you want to remove these photos?"
                                  delegate:self
                                  cancelButtonTitle:@"Remove"
                                  otherButtonTitles:@"Cancel", nil];
            
            [alert show];
            
        }
        else
        {
            [self.photoCollectionView setAllowsMultipleSelection:NO];
            self.addPhotoButton.enabled = YES;
            self.addInternetPhotoButton.enabled = YES;
            self.renameButton.enabled = YES;
            self.removePhotoButton.title = @"Remove Album";
            [self.selectedPhotosToRemove removeAllObjects];
            [self reloadUI];
        }
        
        
        
        
        
        
        
    }
    
    self.isEditable = !self.isEditable;
    
}

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)renameButtonTapped:(UIBarButtonItem *)sender
{
    
}

- (IBAction)AddPhotosButtonTapped:(UIBarButtonItem *)sender
{
    if (!self.selectPhotoPopoverController)
    {
        
        self.imagePicker = [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //self.imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        self.imagePicker.allowsEditing = NO;
        
        
        UIPopoverController* aPopover = [[UIPopoverController alloc]
                                         initWithContentViewController:self.imagePicker];
        aPopover.delegate = self;
        
        // Store the popover in a custom property for later use.
        self.selectPhotoPopoverController = aPopover;
        
        [self.selectPhotoPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

//Lazy initiation of property selectedPhotos
-(NSMutableArray *) selectedPhotos
{
    if (!_selectedPhotos)
    {
        _selectedPhotos = [[NSMutableArray alloc] init];
    }
    return _selectedPhotos;
}

-(void) reloadUI
{
    
    [self.photoCollectionView reloadData];
    
    
    
    
    for(NSIndexPath *indexPath in self.photoCollectionView.indexPathsForSelectedItems)
    {
        
        [self.photoCollectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
    
    [self.delegate writeAlbumsToDatabase];
}


#pragma mark --to get document path
- (NSString *)documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}




#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [self.album countPhotos];
    
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PAPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor whiteColor];
    //Album *album =[self.albums.albums objectAtIndex:indexPath.item];
    //cell.albumTitleLabel.text = album.title;
    Photo *photo;
    
    photo = [self.album.photos objectAtIndex:indexPath.item];
    
    cell.photoThumbnail.image = photo.thumbnail;
    //cell.photoTitle.text = photo.title;
    
    
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isEditable)
    {
        [self.selectedPhotosToRemove addObject:[self.album.photos objectAtIndex:indexPath.item]];
    }
    else
    {
        
        //TODO ----- popup a view to show a photo
        
        
        
//        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        scroll.pagingEnabled = YES;
//        NSInteger numberOfViews = [self.album.photos count];
//        int xPosition = 0;
//        for (Photo* photo in self.album.photos) {
//            UIImage * image = photo.image;
//            CGRect rect = CGRectMake(xPosition, 90.0f, image.size.width, image.size.height);
//            
//            UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
//            [imageView setImage:image];
//            self.view.backgroundColor = [UIColor whiteColor];
//            [scroll addSubview:imageView];
//            xPosition += image.size.width;
//        }
//        scroll.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
//        
//        [self.view addSubview:scroll];
        [self performSegueWithIdentifier:@"ShowAPhoto"
                                  sender:self];
        
        
        [self.photoCollectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
    if (self.isEditable)
    {
        [self.selectedPhotosToRemove removeObject:[self.album.photos objectAtIndex:indexPath.item]];
    }
}

#pragma mark - SelectPhotoSourceDelegate
-(void) photoSourceSelected: (SelectPhotoSourceViewController *)sender
{
    
    

    if(![self isBeingDismissed]) {
        [self dismissViewControllerAnimated:YES completion:^ {
            [self performSegueWithIdentifier:@"SelectPhotos" sender:self];
        }];
    }
    self.photoSource = sender.photoSource;
    
    
}

-(void) photoSourceSelectCancelled
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - SelectPhotoDelegate
-(void) photosSelected: (SelectPhotoViewController *) sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //self.selectedPhotos = sender.selectedPhotos;
    
//    NSLog(@"======================----------=========================");
//    NSLog(@"%d", [sender.selectedPhotos count]);
    for (Photo *photo in sender.selectedPhotos) {
//        NSLog(@"%@", photo);
        
        [self.album addPhoto:photo];
    }
    
    [self reloadUI];
}

-(void) cancelled
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - preparesegue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SelectPhotoSource"])
    {
        // Get reference to the destination view controller
        SelectPhotoSourceViewController *selectPhotoSourceVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here
        selectPhotoSourceVC.delegate = self;
        selectPhotoSourceVC.photoSource = self.photoSource;
        
    }
    
    if ([[segue identifier] isEqualToString:@"SelectPhotos"])
    {
        // Get reference to the destination view controller
        SelectPhotoViewController *selectPhotosVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here
        selectPhotosVC.delegate = self;
        selectPhotosVC.photoSource = self.photoSource;
        selectPhotosVC.selectedPhotos = self.selectedPhotos;
    }
    
    if ([[segue identifier] isEqualToString:@"ShowAPhoto"])
    {
        // Get reference to the destination view controller
        ImageViewController *imageVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here
        imageVC.delegate = self;
        imageVC.album = self.album;
        NSIndexPath *index= [self.photoCollectionView indexPathsForSelectedItems][0];
        imageVC.currentPhotoIndex = index.item;
        
    }
    
}




#pragma mark - select photo from photolibrary popover delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image= [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSData* imageData = UIImagePNGRepresentation(image);
    
    //NSLog([info objectForKey:@"UIImagePickerControllerMediaURL"] description);
    
    
    
    //Generate a random file name
    int numberLen = 8;
    char data[numberLen];
    for (int x=0;x<numberLen;data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *imageName = [[[NSString alloc] initWithBytes:data length:numberLen encoding:NSUTF8StringEncoding] stringByAppendingString:@".png"];
    NSString* fullPathToFile = [[self documentFolderPath] stringByAppendingPathComponent:imageName];
    
    
    
    // and then write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    
        
    Photo *photo = [[Photo alloc] init];
    photo.imageUrl = fullPathToFile;
    photo.imageThumbnailUrl = fullPathToFile;
    photo.isLocalFile = YES;
    
    [self.album addPhoto:photo];    
    
    [self.selectPhotoPopoverController dismissPopoverAnimated:YES];
    self.selectPhotoPopoverController = nil;//to prevent popover controller from popping more than one popover at same time.
    info = nil;
    [self reloadUI];
    
    
}

- (void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.selectPhotoPopoverController = nil;//to prevent popover controller from popping more than one popover at same time.
    //self.imagePicker = nil;
    
}


#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    if (buttonIndex == 0)
        
    {
        for (Photo *photo in self.selectedPhotosToRemove)
        {
            [self.album removePhoto:photo];
        }
        
        
        
        
        
        
        
        
        
    }
    else
    {
        NSArray *indexes = [self.photoCollectionView indexPathsForSelectedItems];
        
        for (int i =0; i < [indexes count]; i++)
        {
            
            [self.photoCollectionView deselectItemAtIndexPath:indexes[i] animated:YES];
        }
        
        
        
        
    }
    
    
    [self.photoCollectionView setAllowsMultipleSelection:NO];
    self.addPhotoButton.enabled = YES;
    self.addInternetPhotoButton.enabled = YES;
    self.renameButton.enabled = YES;
    self.removePhotoButton.title = @"Remove Photos";
    [self.selectedPhotosToRemove removeAllObjects];
    [self reloadUI];
    
}

#pragma mark -- ImageViewControllerDelegate
-(void) imageViewFinished
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


