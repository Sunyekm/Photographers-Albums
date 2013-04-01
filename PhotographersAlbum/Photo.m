//
//  Photo.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "Photo.h"

@implementation Photo


-(UIImage *) image
{
    
    if (!_image)
    {
        if (_imageUrl) {
            
            UIImage *image;
            if (_isLocalFile) {
                
                
                image= [UIImage imageWithContentsOfFile:_imageUrl];
                
                
                
            }
            else
            {
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:_imageUrl]];
                
                image= [UIImage imageWithData:imageData];
                
            }
            
            
            
            float sizeScale;
            if (image.size.height > image.size.width)
            {
                sizeScale = 1024/image.size.height;
            }
            else
            {
                sizeScale = 1024/image.size.width;
            }
            _image = [self scaleImage:image toScale:sizeScale];
            
        }
    }
    
    
    
    return _image;
}

-(UIImage *) thumbnail
{
    if (!_thumbnail)
    {
        if (_imageThumbnailUrl)
        {
            if (_isLocalFile) {
                
                
                
                
                _thumbnail =[UIImage imageWithContentsOfFile:_imageThumbnailUrl];
            }
            else
            {
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:_imageThumbnailUrl]];
                
                _thumbnail= [UIImage imageWithData:imageData];
                
                //
            }
        }
    }
    return _thumbnail;
}

-(NSString *) title
{
    if (!_title)
    {
        _title = @"New Photo";
    }
    return _title;
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
