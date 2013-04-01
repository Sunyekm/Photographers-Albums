//
//  ImageViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-29.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

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
    
    //UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.imageScrollView.pagingEnabled = YES;
    NSInteger numberOfViews = [self.album.photos count];
    int xPosition = 0;
    for (Photo* photo in self.album.photos) {
        UIImage * image = photo.image;
        CGRect rect = CGRectMake(xPosition, 0.0f, image.size.width, image.size.height);
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
        [imageView setImage:photo.image];
        self.view.backgroundColor = [UIColor blackColor];
        [self.imageScrollView addSubview:imageView];
        xPosition += 1024; //photo.image.size.width;
    }
    self.imageScrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
    
    NSLog(@"%d", self.currentPhotoIndex);
    
    //[self.view addSubview:scroll];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender {
}

- (IBAction)BackButtonTapped:(id)sender
{
    [self.delegate imageViewFinished];
}
@end
