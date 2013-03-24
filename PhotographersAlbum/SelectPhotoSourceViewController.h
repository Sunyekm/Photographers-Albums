//
//  SelectPhotoSourceViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class SelectPhotoSourceViewController;

@protocol SelectPhotoSourceDelegate <NSObject>

-(void) photoSourceSelected;

@end

#import <UIKit/UIKit.h>
#import "AlbumViewController.h"

@interface SelectPhotoSourceViewController : UIViewController

@property (nonatomic) enum PhotoSourceType photoSource;
@property (strong, nonatomic) id <SelectPhotoSourceDelegate> delegate;


- (IBAction)addFromLocalTapped:(UIButton *)sender;
- (IBAction)addFromFlickrTapped:(UIButton *)sender;
- (IBAction)addFromWindowsTapped:(UIButton *)sender;
- (IBAction)addFromFacebookTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;


@end
