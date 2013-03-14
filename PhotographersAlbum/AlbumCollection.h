//
//  AlbumCollection.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface AlbumCollection : NSObject

@property (strong, nonatomic) NSMutableArray *albums;

-(void) createAlbum;
-(void) removeAlbum: (Album *) album;





@end
