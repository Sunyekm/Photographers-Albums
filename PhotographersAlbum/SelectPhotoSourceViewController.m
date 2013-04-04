//
//  SelectPhotoSourceViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "SelectPhotoSourceViewController.h"
#import "AlbumViewController.h"


@interface SelectPhotoSourceViewController ()

@end

@implementation SelectPhotoSourceViewController

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
    
    
    //Didn't implement yet.
    
    self.addFromFacebook.enabled = NO;
    self.addFromWindowsButton.alpha = 0.6;
    self.addFromWindowsButton.enabled =NO;
    self.addFromFacebook.alpha = 0.6;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addFromFlickrTapped:(UIButton *)sender
{
    self.photoSource = Flickr;
    [self.delegate photoSourceSelected: self];
    
    
    
}

- (IBAction)addFromWindowsTapped:(UIButton *)sender
{
    self.photoSource =  Windows;
    [self.delegate photoSourceSelected: self];
    
}

- (IBAction)addFromFacebookTapped:(UIButton *)sender
{
    self.photoSource = Facebook;
    [self.delegate photoSourceSelected: self];
}


- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    
    [self.delegate photoSourceSelectCancelled];
}
@end
