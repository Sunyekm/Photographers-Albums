//
//  PAAlbumCoverCell.h
//  PhotographersAlbum
//
//  Created by Ye Sun on 2013-03-14.
//  Copyright (c) 2013 bcit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAAlbumCoverCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverPhoto;

@end
