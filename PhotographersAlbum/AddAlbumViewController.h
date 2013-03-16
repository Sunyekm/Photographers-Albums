//
//  AddAlbumViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-13.
//  Copyright (c) 2013 bcit. All rights reserved.
//

@class AddAlbumViewController;

@protocol AddAlbumViewDelegate

- (void)AddAlbumViewControllerFinished;//:(AddAlbumViewController *) addAlbumViewController;

@end

#import <UIKit/UIKit.h>
#import "Album.h"
#import "AlbumCollection.h"
#import "PAViewController.h"




@interface AddAlbumViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *albumNameTextField;
@property (strong, nonatomic) AlbumCollection *albums;
@property (nonatomic, weak) id <AddAlbumViewDelegate> delegate;


- (IBAction)createAlbum:(UIButton *)sender;
- (IBAction)cancelCreateAlbum:(UIButton *)sender;



@end
