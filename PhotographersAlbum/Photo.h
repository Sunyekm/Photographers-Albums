//
//  Photo.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) UIImage *thumbnail;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *title;
//@property (strong, nonatomic) NSString *authorName;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *imageThumbnailUrl;
@property (nonatomic) BOOL isLocalFile;



- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

@end
