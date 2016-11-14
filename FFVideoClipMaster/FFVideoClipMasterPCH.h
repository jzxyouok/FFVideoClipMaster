//
//  FFVideoClipMasterPCH.h
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#ifndef FFVideoClipMasterPCH_h
#define FFVideoClipMasterPCH_h


#import "FFNavItem.h"


// --> 统一的日志输出
#ifdef DEBUG
#define FFLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define FFLog(fmt, ...)
#endif

//系统框架

#import <AssetsLibrary/AssetsLibrary.h>


// 通用的工具类
#import "UIColor+Category.h"

// ----------
#import "LSYConfig.h"
#import "LSYAlbum.h"


// -----
#define ScreenSize [UIScreen mainScreen].bounds.size
#define kThumbnailLength    ([UIScreen mainScreen].bounds.size.width - 5*5)/4
#define kThumbnailSize      CGSizeMake(kThumbnailLength, kThumbnailLength)
#define DistanceFromTopGuiden(view) (view.frame.origin.y + view.frame.size.height)
#define DistanceFromLeftGuiden(view) (view.frame.origin.x + view.frame.size.width)
#define ViewOrigin(view)   (view.frame.origin)
#define ViewSize(view)  (view.frame.size)

// <-- end 统一的日志输出

#endif /* FFVideoClipMasterPCH_h */
