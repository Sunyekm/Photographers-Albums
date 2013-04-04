//
//  EditAlbumViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-04-02.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "EditAlbumViewController.h"

@interface EditAlbumViewController ()

@end

@implementation EditAlbumViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.changeNameTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okButtonTapped:(UIButton *)sender
{
    [self changeAlbumName:self.changeNameTextField.text];
    [self.delegate editAlbumFinished];
}

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self.delegate editAlbumCancelled];
}

- (void) changeAlbumName: (NSString *) newName
{
    if (newName && ![newName isEqualToString:@""]) {
        self.album.title = newName;
    }
    
}

#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self changeAlbumName:self.changeNameTextField.text];
    
    
    [textField resignFirstResponder];
    [self.delegate editAlbumFinished];
    
    return YES;
}

@end
