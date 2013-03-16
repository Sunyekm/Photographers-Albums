//
//  AddAlbumViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-13.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "AddAlbumViewController.h"




@interface AddAlbumViewController ()

@end

@implementation AddAlbumViewController


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

- (IBAction)createAlbum:(UIButton *)sender
{
    if (![self.albumNameTextField.text isEqualToString:@""])
    {
        [self.albums createAlbum:self.albumNameTextField.text];
    }
    else
    {
        [self.albums createAlbum:@"New Album"];
        //NSLog(@"Created without a title, %d", self.albums.count);
    }
    
    
    [self.delegate AddAlbumViewControllerFinished];
    
    
    
}

- (IBAction)cancelCreateAlbum:(UIButton *)sender
{
    
    
    [self.delegate AddAlbumViewControllerFinished];
    
}
@end
