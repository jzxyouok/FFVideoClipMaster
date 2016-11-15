//
//  LSYAlbum.h
//  AlbumPicker
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright (c) 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^albumGroupsBlock)(NSMutableArray *groups);
typedef void (^albumAssetsBlock)(NSMutableArray *assets);

@interface FFAlbum : NSObject

@property (nonatomic,strong) ALAssetsGroup *assetsGroup;
@property (nonatomic,strong) ALAssetsLibrary *assetsLibrary;
@property (nonatomic,strong) ALAssetsFilter *assstsFilter;
@property (nonatomic,strong) NSMutableArray *groups;
@property (nonatomic,strong) NSMutableArray *assets;

+(FFAlbum *)sharedAlbum;

//**获取所有相册*/
-(void)setupAlbumGroups:(albumGroupsBlock)albumGroups;

//**获取相册下的所有视频*/
-(void)setupAlbumAssets:(ALAssetsGroup *)group withAssets:(albumAssetsBlock)albumAssets;

//**获取所有视频*/
- (void)recriveAllVideoWithAssets:(albumAssetsBlock)albumAssets;


@end
