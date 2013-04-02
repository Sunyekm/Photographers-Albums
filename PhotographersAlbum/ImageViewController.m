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
    
    
    
    
    Photo *photo =[self.album.photos objectAtIndex:self.currentPhotoIndex];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.imageView.image = photo.image;
    
    
    
    
    //self.titleBar.topItem.title = [NSString stringWithFormat:@"%@           %d of %d",photo.title, (self.currentPhotoIndex + 1), [self.album countPhotos]];
    
    [self reloadUI];
    
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

- (IBAction)trashButtonTapped:(UIBarButtonItem *)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Remove this photo"
                          message:@"Are you sure you want to remove this photo?"
                          delegate:self
                          cancelButtonTitle:@"Remove"
                          otherButtonTitles:@"Cancel", nil];
    
    [alert show];
    
    
}

-(void) reloadUI
{
    Photo *photo = [self.album.photos objectAtIndex:self.currentPhotoIndex];
    
    
    self.titleBar.topItem.title = [NSString stringWithFormat:@"%@",photo.title];
    self.toolBarTitleLabel.text = [NSString stringWithFormat:@"%d of %d", (self.currentPhotoIndex + 1), [self.album countPhotos]];
    self.imageView.image = photo.image;
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
    
    
    [self reloadUI];
    
    
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
    
    [self reloadUI];
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

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{
    
    if (buttonIndex == 0)
        
    {
        Photo *photo = [self.album.photos objectAtIndex:self.currentPhotoIndex];
        [self.album removePhoto:photo];
        [self.delegate writeAlbumChangesToDatabase];
        
        if ([self.album countPhotos] == 0) {
            [self.delegate imageViewFinished];
        }else
        {
            self.currentPhotoIndex--;
            
            if (self.currentPhotoIndex < 0)
            {
                self.currentPhotoIndex = 0;
            }
            
            
            photo = [self.album.photos objectAtIndex:self.currentPhotoIndex];
            self.imageView.image = photo.image;
            [self reloadUI];
        }
        
        
    }
    
    
    
        
}


@end
