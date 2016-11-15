//
//  LSYAlbum.m
//  AlbumPicker
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright (c) 2016年 Mr.Yao. All rights reserved.
//

#import "FFAlbum.h"
#import "FFAlbumModel.h"

@interface FFAlbum ()

@end
@implementation FFAlbum
+(FFAlbum *)sharedAlbum{
    static FFAlbum *_album = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _album = [[FFAlbum alloc] init];
        _album.assetsLibrary = [[ALAssetsLibrary alloc] init];
        _album.assstsFilter = [ALAssetsFilter allAssets];
    });
    return _album;
}
-(void)setupAlbumGroups:(albumGroupsBlock)albumGroups{
    NSMutableArray *groups = @[].mutableCopy;
    ALAssetsLibraryGroupsEnumerationResultsBlock resultBlock = ^(ALAssetsGroup *group, BOOL *stop){
        if (group) {
            [group setAssetsFilter:self.assstsFilter];
            NSInteger groupType = [[group valueForProperty:ALAssetsGroupPropertyType] integerValue];
            if (groupType == ALAssetsGroupSavedPhotos) {
                [groups insertObject:group atIndex:0];
                
            }
            else
            {
                if (group.numberOfAssets>0) {
                    [groups addObject:group];
                }
            }
           
        }
        else
        {
            _groups = groups;
            if (albumGroups) {
                albumGroups(groups);
            }
            
        }
    };
    ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error) {
        _groups = groups;
        if (albumGroups) {
            albumGroups(groups);
        }
    };
    [self.assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:resultBlock failureBlock:failureBlock];
    
    
}
-(void)setupAlbumAssets:(ALAssetsGroup *)group withAssets:(albumAssetsBlock)albumAssets{
    NSMutableArray *assets = @[].mutableCopy;
    [group setAssetsFilter:self.assstsFilter];
    NSInteger assetCount = [group numberOfAssets];
    ALAssetsGroupEnumerationResultsBlock resultBlock = ^(ALAsset *asset, NSUInteger index, BOOL *stop) {
        if (asset) {
            FFAlbumModel *model = [[FFAlbumModel alloc] initAlbumModel:asset];
            
            NSString *assetType = [model.asset valueForProperty:ALAssetPropertyType];
            
            
            if ([assetType isEqualToString:ALAssetTypeVideo]) {
                [assets addObject:model];
            }else{
                [assets addObject:model];
            }
            
        }
        
        if (albumAssets) {
            albumAssets(assets);
        }else if ((assets.count >= assetCount)){
            _assets = assets;
            if (albumAssets) {
                albumAssets(assets);
            }
        }else{
            if (albumAssets) {
                albumAssets(assets);
            }
        };
    };
    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:resultBlock];
}

- (void)recriveAllVideoWithAssets:(albumAssetsBlock)albumAssets{
    NSMutableArray *groups = @[].mutableCopy;
    NSMutableArray *allVideoAssets = @[].mutableCopy;

    for (int i = 0; i< self.groups.count; i++) {
        [allVideoAssets addObjectsFromArray: [self receiveAlbumAssets:groups[i]]];
    }
    
    if (albumAssets) {
        albumAssets(allVideoAssets);
    }
}

- (NSMutableArray *)receiveAlbumAssets:(ALAssetsGroup *)group{
    NSMutableArray *assets = @[].mutableCopy;
    [group setAssetsFilter:self.assstsFilter];

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
