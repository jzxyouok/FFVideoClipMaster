//
//  FFNavItem.m
//  FFVideoClipMaster
//
//  Created by Mr.Yao on 16/11/13.
//  Copyright © 2016年 Mr.Yao. All rights reserved.
//

#import "FFNavItem.h"


@implementation FFNavItem

+(UIView *)titleViewWithText:(NSString *)text{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 200, 44.0f)];
    titleLabel.text = text;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
}

+ (UIBarButtonItem *)normalButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

@end
