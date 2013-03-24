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

@end


#import <UIKit/UIKit.h>
#import "Album.h"
#import "Photo.h"
#import "PAPhotoCell.h"
#import "SelectPhotoSourceViewController.h"
#import "SelectPhotoViewController.h"


enum PhotoSourceType
{
    photoLibrary,
    flickr,
    facebook,
    windows,
    
};

@interface AlbumViewController  : UIViewController <SelectPhotoSourceDelegate, SelectPhotoDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate>


@property (strong, nonatomic) Album *album;
@property (weak, nonatomic) id <AlbumViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UINavigationBar *albumBar;
@property (weak, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property (nonatomic) BOOL isEditable;
@property (nonatomic) enum PhotoSourceType photoSource;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) NSMutableArray *selectedPhotos; //Photo
@property (strong, nonatomic) UIPopoverController *selectPhotoPopoverController;


- (IBAction)backButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)renameButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)AddPhotosButtonTapped:(UIBarButtonItem *)sender;

- (void) reloadUI;

@end
