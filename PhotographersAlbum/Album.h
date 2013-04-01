//
//  Album.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"

@interface Album : NSObject

@property (strong, nonatomic) NSMutableArray *photos; //Photo
//@property (strong, nonatomic) NSDate *dateCreated;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) Photo *coverPhoto;

-(id) initWithTitle: (NSString *) title;
-(void) changeTitle: (NSString *) newTitle;
-(void) addPhoto : (Photo *) photo;
-(void) removePhoto: (Photo *) photo;
-(NSInteger) countPhotos;




@end
