//
//  FlickrCell.m
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-25.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import "FlickrCell.h"

@implementation FlickrCell

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
