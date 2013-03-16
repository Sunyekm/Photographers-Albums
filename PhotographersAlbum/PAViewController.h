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




@interface PAViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, AddAlbumViewDelegate, AlbumViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *albumCollectionView;
@property (strong, nonatomic) AlbumCollection *albums;

- (IBAction)tempHelp:(id)sender;
-(void) reloadUI;




@end
