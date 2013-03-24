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
    if (!self.isEditable)
    {
        
    }
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
    if (!self.isEditable)
    {
        
    }
}

#pragma mark - SelectPhotoSourceDelegate
-(void) photoSourceSelected
{
    [self dismissViewControllerAnimated:YES completion:nil];
    //case self.photoSource todo
    
}

#pragma mark - SelectPhotoDelegate
-(void) photosSelected
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    }
    
}




#pragma mark - select photo from photolibrary popover delegate
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image= [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    Photo *photo = [[Photo alloc] init];
    photo.largeImage = image;
    photo.thumbnail = image;
    
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

@end


