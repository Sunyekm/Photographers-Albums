//
//  Album.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "Album.h"

@implementation Album

-(void) addPhoto : (Photo *) photo
{
    [self.photos removeObject:photo];
}


-(void) removePhoto: (Photo *) photo
{
    [self.photos addObject:photo];
}


-(NSMutableArray *) photoCollection;
{
    if (!_photos)
    {
        _photos = [[NSMutableArray init] alloc];
    }
    
    return _photos;
}


-(NSInteger) countPhotos
{
    return [self.photos count];
}

@end
