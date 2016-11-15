//
//  FFVideoChooseViewController.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "FFVideoChooseViewController.h"

#import "FFAlbumCollectionViewCell.h"

#import "FFAlbum.h"

@interface FFVideoChooseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSURL * url;

@property (nonatomic, strong) NSMutableArray * albumDataArray;

@end

@implementation FFVideoChooseViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    
}

-(void)setupViews{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = kThumbnailSize;
    flowLayout.sectionInset = UIEdgeInsetsMake(5,5,5, 5);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    
    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.allowsMultipleSelection = YES;
    
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
   
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.collectionView registerClass:[FFAlbumCollectionViewCell class] forCellWithReuseIdentifier:kFFAlbumCollectionViewCellIdentifier];
    
    __weak typeof(self) weakSelf = self;
    [[FFAlbum sharedAlbum]setupAlbumGroups:^(NSMutableArray *groups) {
        [weakSelf.albumDataArray addObjectsFromArray: [weakSelf setupAlbumAssets:groups]];
        [weakSelf.collectionView reloadData];
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio{
    return self.albumDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FFAlbumCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFFAlbumCollectionViewCellIdentifier forIndexPath:indexPath];
    FFAlbumModel *model = self.albumDataArray[indexPath.row];
    model.indexPath = indexPath;
    cell.model = model;
    return cell;
}

#pragma mark - UICollectionViewDelegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


}


#pragma mark - 数据提取

- (NSMutableArray *)setupAlbumAssets:(NSMutableArray *)groups{
    NSMutableArray *allVideoAssets = @[].mutableCopy;
    for (int i = 0; i< groups.count; i++) {
        [allVideoAssets addObjectsFromArray: [self receiveAlbumAssets:groups[i]]];
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

#pragma mark - lazy init

- (NSMutableArray *)albumDataArray{
    if (!_albumDataArray) {
        _albumDataArray = [[NSMutableArray alloc]init];
    }
    return _albumDataArray;
}


#pragma mark - ---

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
