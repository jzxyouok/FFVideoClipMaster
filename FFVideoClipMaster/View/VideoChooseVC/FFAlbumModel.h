//
//  FFAlbumModel.h
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/15.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFAlbumModel : NSObject

@property (nonatomic,strong) ALAsset *asset;
@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,strong,readonly) NSString *assetType;
@property (nonatomic) BOOL isSelect;

+(instancetype)AlbumModel:(ALAsset *)asset;

-(instancetype)initAlbumModel:(ALAsset *)asset;

@end
