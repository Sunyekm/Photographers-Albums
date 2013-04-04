//
//  AlbumViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-15.
//  Copyright (c) 2013 bcit. All rights reserved.
//

@class AlbumViewController;

@protocol AlbumViewControllerDelegate <NSObject>

@optional
-(void) albumViewFinished : (AlbumViewController *) albumVC;
-(void) writeAlbumsToDatabase;

@end


#import <UIKit/UIKit.h>
#import "Album.h"
#import "Photo.h"
#import "PAPhotoCell.h"
#import "SelectPhotoSourceViewController.h"
#import "SelectPhotoViewController.h"
#import "ImageViewController.h"
#import "EditAlbumViewController.h"

enum photoSourceType
{
    Flickr=1,
    Facebook=2,
    Windows=3,
};


@interface AlbumViewController  : UIViewController <SelectPhotoSourceDelegate, SelectPhotoDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate,ImageViewDelegate,EditAlbumDelegate>


@property (strong, nonatomic) Album *album;
@property (weak, nonatomic) id <AlbumViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addPhotoButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addInternetPhotoButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *renameButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *removePhotoButton;

@property (weak, nonatomic) IBOutlet UINavigationBar *albumBar;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property (nonatomic) BOOL isEditable;
@property (nonatomic) enum photoSourceType photoSource;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) NSMutableArray *selectedPhotos; //Photo from photo source to add

@property (strong, nonatomic) NSMutableArray *selectedPhotosToRemove;
@property (strong, nonatomic) UIPopoverController *selectPhotoPopoverController;

@property (strong, nonatomic) UIActivityIndicatorView *mySpinner;


- (IBAction)removePhotoButtonTapped:(UIBarButtonItem *)sender;

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)renameButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)AddPhotosButtonTapped:(UIBarButtonItem *)sender;

- (void) reloadUI;

@end
