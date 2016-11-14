//
//  FFVideoChooseViewController.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "FFVideoChooseViewController.h"
#import "LSYNavigationController.h"
#import "LSYAlbumCatalog.h"

@interface FFVideoChooseViewController ()<LSYAlbumCatalogDelegate>

@end

@implementation FFVideoChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    albumCatalog.delegate = self;
    LSYNavigationController *navigation = [[LSYNavigationController alloc] initWithRootViewController:albumCatalog];
    albumCatalog.maximumNumberOfSelectionVideo = 1;
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}

-(void)AlbumDidFinishPick:(NSArray *)assets{
    
    for (ALAsset *asset in assets) {
        if ([[asset valueForProperty:@"ALAssetPropertyType"] isEqual:@"ALAssetTypePhoto"]) {
            UIImage * img = [UIImage imageWithCGImage:asset.defaultRepresentation.fullResolutionImage];
        }
        else if ([[asset valueForProperty:@"ALAssetPropertyType"] isEqual:@"ALAssetTypeVideo"]){
            NSURL *url = asset.defaultRepresentation.url;
        }
    }

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
