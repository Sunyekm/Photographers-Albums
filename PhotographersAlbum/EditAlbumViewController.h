//
//  EditAlbumViewController.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-04-02.
//  Copyright (c) 2013 bcit. All rights reserved.
//
@class EditAlbumViewController;

@protocol EditAlbumDelegate <NSObject>

-(void) editAlbumCancelled;
-(void) editAlbumFinished;

@end

#import <UIKit/UIKit.h>
#import "Album.h"

@interface EditAlbumViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) id<EditAlbumDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *changeNameTextField;
@property (strong, nonatomic) Album *album;


- (IBAction)okButtonTapped:(UIButton *)sender;
- (IBAction)cancelButtonTapped:(UIButton *)sender;



@end
