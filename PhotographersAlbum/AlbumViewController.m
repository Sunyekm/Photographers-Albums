//
//  AlbumViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-15.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

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
    //NSLog([self.album description]);
    self.albumBar.topItem.title = @"aaaaaaa";
    //NSLog([self.album.photos description]);
    self.album.title = @"aaa";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender
{
    //[self.delegate albumViewFinished:self];
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end
