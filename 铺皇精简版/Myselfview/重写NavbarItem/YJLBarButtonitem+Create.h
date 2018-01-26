//
//  YJLBarButtonitem+Create.h
//  铺皇精简版
//
//  Created by selice on 2017/12/7.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Create)
+ (instancetype)leftbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

+(instancetype)leftbarButtonItemWithName:(NSString *)titleName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

#pragma - mark 右边标题形式
+(instancetype)rightbarButtonItemWithName:(NSString *)titleName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;

@end
