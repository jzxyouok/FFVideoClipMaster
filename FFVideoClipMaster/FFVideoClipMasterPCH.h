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



// 通用的工具类
#import "UIColor+Category.h"



#endif
// <-- end 统一的日志输出

#endif /* FFVideoClipMasterPCH_h */
