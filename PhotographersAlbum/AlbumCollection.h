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

@property (strong, nonatomic) NSMutableArray *albums; //Album

-(void) createAlbum: (NSString *) title;
-(void) removeAlbum: (Album *) album;
-(NSInteger) count;





@end
