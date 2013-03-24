//
//  AlbumCollection.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "AlbumCollection.h"

@implementation AlbumCollection

-(NSMutableArray *) albums
{
    if (!_albums) _albums =  [[NSMutableArray alloc] init];
    return  _albums;
}

-(void) createAlbum: (NSString *) title
{
    Album *album = [[Album alloc] initWithTitle:title];
    
    [self.albums addObject:album];
    
}
-(void) removeAlbum: (Album *) album
{

}

-(NSInteger) countAlbums
{
    return [self.albums count];
}

@end
