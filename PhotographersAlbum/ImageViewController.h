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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;



@property (strong, nonatomic) Album *album;
@property (strong, nonatomic) id <ImageViewDelegate> delegate;


- (IBAction)backButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)nextButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)previousButtonTapped:(UIBarButtonItem *)sender;



@property (nonatomic) BOOL interfaceIsHidden;

@property (nonatomic) int currentPhotoIndex;

-(void) nextPhoto;
-(void) previousPhoto;

@end
