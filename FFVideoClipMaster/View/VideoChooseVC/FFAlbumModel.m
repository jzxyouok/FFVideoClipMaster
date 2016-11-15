//
//  FFAlbumModel.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "FFAlbumModel.h"

@implementation FFAlbumModel


-(instancetype)initAlbumModel:(ALAsset *)asset{
    self = [super init];
    if (self) {
        _asset = asset;
        _isSelect = NO;
        _assetType = [asset valueForProperty:ALAssetPropertyType];
    }
    return self;
}

+(instancetype)AlbumModel:(ALAsset *)asset{
    return [[FFAlbumModel alloc] initAlbumModel:asset];
}

@end
