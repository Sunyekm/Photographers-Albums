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

@end

#import <UIKit/UIKit.h>
#import "Album.h"

@interface ImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (strong, nonatomic) Album *album;
@property (strong, nonatomic) id <ImageViewDelegate> delegate;

@property (nonatomic) BOOL toolBarIsHidden;

@property (nonatomic) BOOL currentPhotoIndex;

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender;
- (IBAction)BackButtonTapped:(UINavigationItem *)sender;
@end
