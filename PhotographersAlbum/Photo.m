//
//  Photo.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-12.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "Photo.h"

@implementation Photo

//-(float) xOffset
//{
//    if (!_xOffset)
//    {
//        _xOffset = 0.0;
//    }
//    return _xOffset;
//}


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
            if (image.size.height >= image.size.width)
            {
                if (image.size.height > 2048)
                {
                    sizeScale = 768.0/image.size.height;
                    _image = [self scaleImage:image toScale:sizeScale];
                }
                else
                {
                    _image = image;
                }
                
                
            }
            else
            {
                if (image.size.width > 2048)
                {
                    sizeScale = 1024.0/image.size.width;
                    _image = [self scaleImage:image toScale:sizeScale];

                }
                else
                {
                    _image = image;
                }


            }
            
            
        }
    }
    
    NSLog(@"%f", _image.size.width);
    NSLog(@"%f", _image.size.height);

    
    
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
        _title = @"";
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
