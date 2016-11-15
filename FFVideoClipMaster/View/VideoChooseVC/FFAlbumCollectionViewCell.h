//
//  FFAlbumCollectionViewCell.h
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FFAlbumModel.h"

static NSString * const kFFAlbumCollectionViewCellIdentifier = @"FFAlbumCollectionViewCell";

@interface FFAlbumCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) FFAlbumModel *model;
@end

@interface FFAlbumCellBottomView : UIView
@property (nonatomic) double interval;

@end
