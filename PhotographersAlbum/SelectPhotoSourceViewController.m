//
//  SelectPhotoSourceViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-23.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "SelectPhotoSourceViewController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addFromLocalTapped:(UIButton *)sender
{
    self.photoSource = photoLibrary;
    [self.delegate photoSourceSelected];
}

- (IBAction)addFromFlickrTapped:(UIButton *)sender
{
    self.photoSource = flickr;
    [self.delegate photoSourceSelected];
}

- (IBAction)addFromWindowsTapped:(UIButton *)sender
{
    self.photoSource = windows;
    [self.delegate photoSourceSelected];
}

- (IBAction)addFromFacebookTapped:(UIButton *)sender
{
    self.photoSource = facebook;
    [self.delegate photoSourceSelected];
}


- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    
    [self.delegate photoSourceSelected];
}
@end
