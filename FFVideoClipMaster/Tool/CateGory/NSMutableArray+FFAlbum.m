//
//  NSMutableArray+FFAlbum.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "NSMutableArray+FFAlbum.h"
#import "FFAlbumModel.h"

@implementation NSMutableArray (FFAlbum)


- (NSMutableArray *)setupAlbumAssets{
    NSMutableArray *allVideoAssets = @[].mutableCopy;
    for (int i = 0; i< self.count; i++) {
        [allVideoAssets addObjectsFromArray: [self receiveAlbumAssets:self[i]]];
    }
    return allVideoAssets;
}

- (NSMutableArray *)receiveAlbumAssets:(ALAssetsGroup *)group{
    NSMutableArray *assets = @[].mutableCopy;
    [group setAssetsFilter:[ALAssetsFilter allVideos]];
    
    ALAssetsGroupEnumerationResultsBlock resultBlock = ^(ALAsset *asset, NSUInteger index, BOOL *stop) {
        if (asset) {
            FFAlbumModel *model = [[FFAlbumModel alloc] initAlbumModel:asset];
            NSString *assetType = [model.asset valueForProperty:ALAssetPropertyType];
            if ([assetType isEqualToString:ALAssetTypeVideo]) {
                [assets addObject:model];
            }
        }
        
    };
    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:resultBlock];
    
    return assets;
}

@end
