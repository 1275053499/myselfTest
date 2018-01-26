//
//  YJLWebViewController.h
//  铺皇精简版
//
//  Created by selice on 2018/1/23.
//  Copyright © 2018年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJLWebViewController : UIViewController
/**
 初始化方法
 
 @param url 传入的外部链接<用于跳转的链接>
 @param title 导航的标题<如果未传入导航标题,默认是web加载的标题显示>
 @return return value description
 */
- (instancetype)initWithUrl:(NSString *)url andNavgationTitle:(NSString *)title;
@end
