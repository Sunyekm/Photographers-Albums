//
//  ImageViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-29.
//  Copyright (c) 2013 bcit. All rights reserved.
//

@class ImageViewController;

@protocol ImageViewDelegate <NSObject>

-(void) imageViewFinished;
-(void) writeAlbumChangesToDatabase;

@end

#import <UIKit/UIKit.h>
#import "Album.h"
#import "Photo.h"

@interface ImageViewController : UIViewController <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;
@property (weak, nonatomic) IBOutlet UILabel *toolBarTitleLabel;



@property (strong, nonatomic) Album *album;
@property (strong, nonatomic) id <ImageViewDelegate> delegate;
@property (nonatomic) BOOL interfaceIsHidden;
@property (nonatomic) int currentPhotoIndex;

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)nextButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)previousButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)trashButtonTapped:(UIBarButtonItem *)sender;


@property (strong, nonatomic) UIImage *preLoadPhotoPrevious;
@property (strong, nonatomic) UIImage *preLoadPhotoNext;



-(void) nextPhoto;
-(void) previousPhoto;
-(void) preloadPhotos;

@end
