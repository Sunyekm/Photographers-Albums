//
//  SelectPhotoViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class SelectPhotoViewController;

@protocol SelectPhotoDelegate <NSObject>

- (void) photosSelected : (SelectPhotoViewController *) sender;
- (void) cancelled;

@end

#import <UIKit/UIKit.h>
#import "AlbumViewController.h"
#import "Album.h"
#import "FlickrCell.h"
#import "FlickrFetcher.h"

@interface SelectPhotoViewController : UIViewController

@property (nonatomic) enum photoSourceType photoSource;
@property (strong, nonatomic) NSArray *flickrPhotos; // of NSDictionary
@property (strong, nonatomic) NSMutableArray *photos; // of Photo
@property (strong, nonatomic) NSMutableArray *selectedPhotos; // of Photo
@property (strong, nonatomic) id <SelectPhotoDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *flickrCV;
@property (weak, nonatomic) IBOutlet UINavigationBar *titleBar;



- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender;

@end
