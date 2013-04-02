//
//  SelectPhotoViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "SelectPhotoViewController.h"

@interface SelectPhotoViewController ()

@end

@implementation SelectPhotoViewController

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
    
    
    
    switch (self.photoSource) {
        case Flickr:
            self.titleBar.topItem.title = @"Flickr";
            break;
        case Facebook:
            self.titleBar.topItem.title = @"Facebook";
            break;
        case Windows:
            self.titleBar.topItem.title = @"Windows File Sharing";
            break;
        default:
            break;
    }
    
    [self.flickrCV setAllowsMultipleSelection:YES];
    self.selectedPhotos = nil;
    
    self.flickrPhotos = [FlickrFetcher stanfordPhotos];
    
    
    
    
    
    [self loadFlickrPhotos];
    
        
    
    
    
}


- (void) loadFlickrPhotos
{
    self.flickrPhotos = [FlickrFetcher latestGeoreferencedPhotos];
    

    for (NSDictionary *fPhoto in self.flickrPhotos)
    {
        Photo *photo = [[Photo alloc] init];
        
        photo.imageUrl = [FlickrFetcher urlStringForPhoto:fPhoto format:FlickrPhotoFormatLarge];
        
        photo.imageThumbnailUrl = [FlickrFetcher urlStringForPhoto:fPhoto format:FlickrPhotoFormatSquare];
        
        photo.title = fPhoto[FLICKR_PHOTO_TITLE];
        
        photo.isLocalFile = NO;
        
        [self.photos addObject:photo];
        
        
        
        NSLog(@"%@",photo.imageUrl);
        NSLog(@"%@",photo.imageThumbnailUrl);
        NSLog(@"%@",photo.title);
        
                

    }
        
    

    
    

    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void) setPhotos : (NSMutableArray *) photos
//{
//    _photos = photos;
//    [self.flickrCV reloadData];
//}


- (NSMutableArray *) photos
{
    if (!_photos) {
        _photos = [[NSMutableArray alloc] init];
    }
    return _photos;
}


- (NSMutableArray *)selectedPhotos
{
    if (!_selectedPhotos)
    {
        _selectedPhotos = [[NSMutableArray alloc] init];
    }
    return _selectedPhotos;
}


- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender
{
    
    [self.delegate cancelled];
}

- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    [self.delegate photosSelected : self];
}



#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [self.photos count];
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FlickrCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    
    cell.flickrThumbnail.image = [UIImage imageNamed:@"default_image.png"];
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("image downloader", NULL);
    dispatch_async(downloadQueue, ^{
        Photo *photo = [self.photos objectAtIndex:indexPath.item];
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:photo.imageThumbnailUrl]];
        UIImage *image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.flickrThumbnail.image = image;
        });
    });
    
    
    
    
    
    
//    NSLog(@"%d", indexPath.item);
//    NSLog(photo.imageThumbnailUrl);
//    NSLog(photo.imageUrl);
//    NSLog(photo.title);
    
        
    
    
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.selectedPhotos addObject:[self.photos objectAtIndex:indexPath.item]];
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedPhotos removeObject:[self.photos objectAtIndex:indexPath.item]];
}

@end
