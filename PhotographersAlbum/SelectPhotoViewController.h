//
//  SelectPhotoViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class SelectPhotoViewController;

@protocol SelectPhotoDelegate <NSObject>

- (void) photosSelected;
- (void) cancelled;

@end
#import <UIKit/UIKit.h>
#import "AlbumViewController.h"
#import "Album.h"

@interface SelectPhotoViewController : UIViewController

@property (nonatomic) enum PhotoSourceType photoSource;
@property (strong, nonatomic) Album *album;
@property (strong, nonatomic) id <SelectPhotoDelegate> delegate;

@end
