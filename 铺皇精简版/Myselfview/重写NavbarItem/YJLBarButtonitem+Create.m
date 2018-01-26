//
//  YJLBarButtonitem+Create.m
//  铺皇精简版
//
//  Created by selice on 2017/12/7.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "YJLBarButtonitem+Create.h"

@implementation UIBarButtonItem (Create)

#pragma - mark 左边标题形式
+(instancetype)leftbarButtonItemWithName:(NSString *)titleName highImage:(NSString *)highImageName target:(id)target action:(SEL)action{

    UIButton *button            = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds               = CGRectMake(0, 0, 44, 44);
    button.contentEdgeInsets    = UIEdgeInsetsMake(0,0,0, 0);
    button.imageEdgeInsets      = UIEdgeInsetsMake(0,0,0, 0);
    if (iOS11) {
        [button sizeToFit];
    }
    
    [button setTitleColor:RGB(0, 0, 0) forState:UIControlStateNormal];
    [button setTitle:[NSString stringWithFormat:@"%@", titleName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];

}

#pragma - mark 右边标题形式
+(instancetype)rightbarButtonItemWithName:(NSString *)titleName highImage:(NSString *)highImageName target:(id)target action:(SEL)action{

    UIButton *button         =  [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds            =  CGRectMake(0, 0, 44, 44);
    button.contentEdgeInsets =  UIEdgeInsetsMake(0, 0,0, 0);
    button.imageEdgeInsets   =  UIEdgeInsetsMake(0, 0,0, 0);
    if (iOS11) {
        [button sizeToFit];
    }
    
    [button setTitleColor:RGB(0, 0, 0) forState:UIControlStateNormal];
    [button setTitle:[NSString stringWithFormat:@"%@", titleName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];

}

#pragma - mark 左边图片按钮
+ (instancetype)leftbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action{
    
    UIButton *button         = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds            = CGRectMake(0, 0, 44, 44);
    button.imageEdgeInsets   = UIEdgeInsetsMake(0, -20,0, 0);
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma - mark 右边图片按钮
+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action{
    
    UIButton *button          = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds             = CGRectMake( 0, 0, 44, 44);
    button.imageEdgeInsets    = UIEdgeInsetsMake(0, 0, 0, -20);
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
