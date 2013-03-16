//
//  AlbumViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-15.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class AlbumViewController;

@protocol AlbumViewControllerDelegate <NSObject>

-(void) albumViewFinished : (AlbumViewController *) albumVC;

@end

#import <UIKit/UIKit.h>
#import "Album.h"

@interface AlbumViewController : UIViewController


@property (strong, nonatomic) Album *album;
@property (weak, nonatomic) id <AlbumViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UINavigationBar *albumBar;

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender;

@end
