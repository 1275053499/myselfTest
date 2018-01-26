//
//  CitychangeController.h
//  铺皇精简版
//
//  Created by selice on 2017/12/8.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  类型自定义 传值多个
 */
typedef void (^ReturnCityBlock) (NSString *cityname, NSString *cityid);

@interface CitychangeController : UIViewController

/**
 *  声明一个ReturnValueBlock属性，这个Block是获取传值的界面传进来的
 */
@property(nonatomic, copy) ReturnCityBlock returnCityBlock;

@end
