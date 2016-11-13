//
//  FFNavItem.h
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FFNavItem : NSObject

+ (UIView *)titleViewWithText:(NSString *)text;


+ (UIBarButtonItem *)normalButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image;


@end
