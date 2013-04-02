//
//  PAViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumCollection.h"
#import "AddAlbumViewController.h"
#import "PAAlbumCoverCell.h"
#import "AlbumViewController.h"
#import <QuartzCore/QuartzCore.h>



@interface PAViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AddAlbumViewDelegate, AlbumViewControllerDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *albumCollectionView;
@property (strong, nonatomic) AlbumCollection *albums;
@property (strong, nonatomic) NSMutableArray *selectedAlbums;
@property (nonatomic) BOOL isEditable;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNewAlbumButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *settingButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *helpButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *removeAlbumButton;

@property (strong, nonatomic) NSMutableDictionary *albumDatabase;
@property (strong, nonatomic) NSString *databasePath;




- (IBAction)removeAlbumButtonTapped:(UIBarButtonItem *)sender;
- (void) reloadUI;

- (void) loadDatabase;
- (void) writeDatabase;
- (void) loadObjectFromDatabase;
- (void) saveObjecttoDatabase;

@end
