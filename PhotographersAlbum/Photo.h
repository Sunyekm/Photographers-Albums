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
@property (strong, nonatomic) UIImage *largeImage;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *authorName;
@property (strong, nonatomic) NSURL *imageUrl;



@end
