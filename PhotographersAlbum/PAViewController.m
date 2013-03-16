//
//  PAViewController.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "PAViewController.h"

@interface PAViewController ()

@end

@implementation PAViewController 

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
    
    self.albums = [[AlbumCollection alloc] init];
    
    self.albumCollectionView.backgroundColor = [UIColor blackColor];
    
    [self reloadUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self reloadUI];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(Album *)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"CreateNewAlbum"])
    {
        // Get reference to the destination view controller
        AddAlbumViewController *addAlbumVC = [segue destinationViewController];
        
        // Pass any objects to the view controller here
        addAlbumVC.albums = self.albums;
        addAlbumVC.delegate = self;
    }
    
    
    if ([[segue identifier] isEqualToString:@"PushAlbumView"])
    {
        AlbumViewController *albumVC = [segue destinationViewController];
        
        
        albumVC.album = sender;
        
        albumVC.delegate = self;
    }
}

 

- (IBAction)tempHelp:(id)sender
{
    NSLog(@"%d",[self.albums count]);
    [self reloadUI];
}

-(void) reloadUI
{
    
    [self.albumCollectionView reloadData];
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [self.albums count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PAAlbumCoverCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor whiteColor];
    Album *album =[self.albums.albums objectAtIndex:indexPath.item];
    cell.albumTitleLabel.text = album.title;
    
    
    if (album.photos)
    {
        Photo *coverPhoto = [album.photos objectAtIndex:0];
        if (coverPhoto)
        {
            
            cell.coverPhoto.image =  coverPhoto.thumbnail;
        }
    }
    
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Album *album = [self.albums.albums objectAtIndex:indexPath.item];
    
    
    [self performSegueWithIdentifier:@"PushAlbumView" sender:album];
    //[self.albumCollectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}



/*
#pragma mark – UICollectionViewDelegateFlowLayout

// 1

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSString *searchTerm = self.searches[indexPath.section]; FlickrPhoto *photo =self.searchResults[searchTerm][indexPath.row];
    // 2
    CGSize retval = CGSizeMake(180, 180);
    retval.height += 35; retval.width += 35; return retval;
}
 


// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}
*/

#pragma mark - AlbumViewControllerDelegate
-(void) albumViewFinished: (AlbumViewController *) albumVC
{
    //NSLog(@"started");
    //[self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"should be dismissed");
    
    //[self reloadUI];
    
}

#pragma mark - AddAlbumViewControllerDelegate
- (void)AddAlbumViewControllerFinished
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self reloadUI];
}
    
@end
