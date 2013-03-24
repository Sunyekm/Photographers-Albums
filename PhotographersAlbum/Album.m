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
    if (!_photos)
    {
        _photos = [[NSMutableArray alloc] init];
    }
    [self.photos addObject:photo];
}


 -(id) initWithTitle: (NSString *) title
{
    //self = [self init];
    self = [super init];
    self.title = title;
    return self;
}



-(void) removePhoto: (Photo *) photo
{
    
    [self.photos removeObject:photo];
}




 /*
  -(NSMutableArray *) photos;
{
    if (!_photos)
    {
        _photos = [[NSMutableArray init] alloc];
    }
    
    return _photos;
}
 */
 

-(Photo *)coverPhoto;
{
    if (!_coverPhoto && [self.photos count] >0)
    {
        _coverPhoto = [self.photos objectAtIndex:0];
    }
    return  _coverPhoto;
}

-(void) changeTitle: (NSString *) newTitle
{
    self.title = newTitle;
}

-(NSInteger) countPhotos
{
    return [self.photos count];
}

@end
