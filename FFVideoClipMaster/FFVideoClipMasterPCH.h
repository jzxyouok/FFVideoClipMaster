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


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif
// <-- end 统一的日志输出

#endif /* FFVideoClipMasterPCH_h */
