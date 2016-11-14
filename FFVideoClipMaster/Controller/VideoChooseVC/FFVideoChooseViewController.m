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

#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#define SystemVersion [[UIDevice currentDevice].systemVersion floatValue]


@interface FFVideoChooseViewController ()<LSYAlbumCatalogDelegate>

@property (nonatomic, strong) NSURL * url;
@end

@implementation FFVideoChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)AlbumDidFinishPick:(NSArray *)assets{
    
    for (ALAsset *asset in assets) {
        if ([[asset valueForProperty:@"ALAssetPropertyType"] isEqual:@"ALAssetTypePhoto"]) {
          //  UIImage * img = [UIImage imageWithCGImage:asset.defaultRepresentation.fullResolutionImage];
            
        }
        else if ([[asset valueForProperty:@"ALAssetPropertyType"] isEqual:@"ALAssetTypeVideo"]){
            NSURL *url = asset.defaultRepresentation.url;
            self.url = url;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.url) {
        [self vipPlayerViewViewControllerWithVideoUrl:self.url];
        self.url = nil;
    }
}


- (void)vipPlayerViewViewControllerWithVideoUrl:(NSURL *)urlString {
    if (SystemVersion >= 9.0) {
        AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:urlString];
        playerVC.player = [AVPlayer playerWithPlayerItem:item];
        [self presentViewController:playerVC
                                                               animated:YES
                                                             completion:^{
                                                                 [playerVC.player play];
                                                             }];
    } else {
        MPMoviePlayerViewController *moviePlayerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:urlString];
        [self presentViewController:moviePlayerVC
                                                               animated:YES
                                                             completion:^{
                                                                 [moviePlayerVC.moviePlayer play];
                                                             }];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    
    albumCatalog.delegate = self;
    
    LSYNavigationController *navigation = [[LSYNavigationController alloc] initWithRootViewController:albumCatalog];
    albumCatalog.maximumNumberOfSelectionVideo = 1;
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
