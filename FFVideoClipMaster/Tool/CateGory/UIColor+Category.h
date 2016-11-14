//
//  UIColor+Category.h
//  PrivateKitchen
//
//  Created by Adrift on 2016/10/14.
//  Copyright © 2016年 YuHaitao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

@interface UIColor (Category)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
