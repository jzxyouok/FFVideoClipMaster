//
//  FFVideoChooseViewController.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "FFVideoChooseViewController.h"
#import "NSMutableArray+FFAlbum.h"

#import "FFAlbumCollectionViewCell.h"

#import "FFAlbum.h"

@interface FFVideoChooseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UIView *headView;
@property (strong, nonatomic) UICollectionView *collectionView;

@property (nonatomic, strong) NSURL * url;

@property (nonatomic, strong) NSMutableArray * albumDataArray;

@property (nonatomic)int selectNumbers;
@property (nonatomic,strong) NSMutableArray *assetsSort;

@property (nonatomic) NSInteger maxminumNumber;


@end

@implementation FFVideoChooseViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    
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

#pragma mark -UICollectionViewDelegate

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.maxminumNumber) {
        
        if (!(self.maxminumNumber > collectionView.indexPathsForSelectedItems.count)) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"最多只能选%d个文件",(int)self.maxminumNumber] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            return NO;
        }
        
        return YES;
    }
    else
        return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectNumbers = (int)collectionView.indexPathsForSelectedItems.count;
    [self.assetsSort addObject:indexPath];
    FFAlbumModel *model = self.albumDataArray[indexPath.row];

    
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectNumbers = (int)collectionView.indexPathsForSelectedItems.count;
    

    [self.assetsSort removeObject:indexPath];
}


#pragma mark - init Views

-(void)setupViews{
    self.assetsSort = [NSMutableArray array];
    self.maxminumNumber = 1;
    
    
    [self.view addSubview:self.collectionView];
    
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
        [weakSelf.albumDataArray addObjectsFromArray: [groups setupAlbumAssets]];
        [weakSelf.collectionView reloadData];
    }];
    
}

#pragma mark - lazy init

- (NSMutableArray *)albumDataArray{
    if (!_albumDataArray) {
        _albumDataArray = [[NSMutableArray alloc]init];
    }
    return _albumDataArray;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = kThumbnailSize;
        flowLayout.sectionInset = UIEdgeInsetsMake(5,5,5, 5);
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ViewSize(self.view).width, ViewSize(self.view).height) collectionViewLayout:flowLayout];
        _collectionView.allowsMultipleSelection = YES;

        
        [self.collectionView registerClass:[FFAlbumCollectionViewCell class] forCellWithReuseIdentifier:kFFAlbumCollectionViewCellIdentifier];
        
        _collectionView.delegate = self;
        _collectionView.delegate = self;
        
        _collectionView.alwaysBounceVertical = YES;
        
        self.collectionView.showsVerticalScrollIndicator = NO;
        
        self.collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}


#pragma mark - ---

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
