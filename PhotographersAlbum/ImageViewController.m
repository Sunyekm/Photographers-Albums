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
//    self.imageScrollView.pagingEnabled = YES;
//    NSInteger numberOfViews = [self.album.photos count];
//    int xPosition = 0;
//    for (Photo* photo in self.album.photos) {
//        UIImage * image = photo.image;
//        CGRect rect = CGRectMake((xPosition+photo.xOffset), photo.yOffset, image.size.width, image.size.height);
//        
//        UIImageView * imageView = [[UIImageView alloc] initWithFrame:rect];
//        [imageView setImage:image];
//        self.view.backgroundColor = [UIColor blackColor];
//        [self.imageScrollView addSubview:imageView];
//        xPosition += 1024; //photo.image.size.width;
//    }
//    self.imageScrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.view.frame.size.height);
    
    //NSLog(@"%d", self.currentPhotoIndex);
    
    //[self.view addSubview:scroll];
    
    
    Photo *photo =[self.album.photos objectAtIndex:self.currentPhotoIndex];
    
    self.imageView.image = photo.image;
    
    self.titleBar.topItem.title = [NSString stringWithFormat:@"%@           %d of %d",photo.title, (self.currentPhotoIndex + 1), [self.album countPhotos]];
    
    [self showInterface];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)backButtonTapped:(UIBarButtonItem *)sender
{
    [self.delegate imageViewFinished];
}

- (IBAction)nextButtonTapped:(UIBarButtonItem *)sender
{
    [self nextPhoto];
}

- (IBAction)previousButtonTapped:(UIBarButtonItem *)sender
{
    
    [self previousPhoto];
}

-(void) nextPhoto
{
    if (self.currentPhotoIndex == ([self.album countPhotos]-1))
    {
        self.currentPhotoIndex = 0;
    }
    else
    {
        self.currentPhotoIndex++;
    }
    
    NSLog(@"%d", [self.album countPhotos]);
    NSLog(@"%d", self.currentPhotoIndex);
    
    
    Photo *photo = [self.album.photos objectAtIndex:self.currentPhotoIndex];
    
    
    self.titleBar.topItem.title = [NSString stringWithFormat:@"%@           %d of %d",photo.title, (self.currentPhotoIndex + 1), [self.album countPhotos]];
    self.imageView.image = photo.image;
}

-(void) previousPhoto
{
    if (self.currentPhotoIndex == 0) {
        self.currentPhotoIndex = [self.album countPhotos] - 1;
    }
    else
    {
        self.currentPhotoIndex--;
    }
    
    Photo *photo = [self.album.photos objectAtIndex:self.currentPhotoIndex];
    
    
    self.titleBar.topItem.title = [NSString stringWithFormat:@"%@           %d of %d",photo.title, (self.currentPhotoIndex + 1), [self.album countPhotos]];
    self.imageView.image = photo.image;
}

- (IBAction)imageTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"tapped.........");
    NSLog(@"%d", self.interfaceIsHidden);
    
    if (self.interfaceIsHidden)
    {
        [self showInterface];
    }
    else
    {
        [self hideInterface];
    }
}


-(void) showInterface
{
    self.titleBar.hidden = NO;
    self.toolBar.hidden = NO;
    self.interfaceIsHidden = NO;
}

-(void) hideInterface
{
    self.titleBar.hidden =YES;
    self.toolBar.hidden =YES;
    self.interfaceIsHidden = YES;
}

@end
