//
//  SelectPhotoSourceViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class SelectPhotoSourceViewController;

@protocol SelectPhotoSourceDelegate <NSObject>

-(void) photoSourceSelected: (SelectPhotoSourceViewController *)sender;
-(void) photoSourceSelectCancelled;

@end

#import <UIKit/UIKit.h>
#import "AlbumViewController.h"

@interface SelectPhotoSourceViewController : UIViewController

@property (nonatomic) enum photoSourceType photoSource;

@property (strong, nonatomic) id <SelectPhotoSourceDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *addFromWindowsButton;
@property (weak, nonatomic) IBOutlet UIButton *addFromFacebook;

- (IBAction)addFromFlickrTapped:(UIButton *)sender;
- (IBAction)addFromWindowsTapped:(UIButton *)sender;
- (IBAction)addFromFacebookTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;


@end
