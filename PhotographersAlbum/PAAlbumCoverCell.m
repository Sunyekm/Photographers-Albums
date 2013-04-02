//
//  PAAlbumCoverCell.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-14.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "PAAlbumCoverCell.h"

@implementation PAAlbumCoverCell


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        
        
        bgView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7];
        //bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
        //bgView.layer.borderWidth = 4;
        self.selectedBackgroundView = bgView;
    }
    return self;
}

//-(UIImageView *)coverPhoto
//{
//    if (!_coverPhoto) {
//        _coverPhoto = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:@"default_image.png"]];
//        
//    }
//    return _coverPhoto;
//}



@end
