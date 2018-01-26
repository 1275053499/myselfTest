//
//  FirstCell.h
//  铺皇精简版
//
//  Created by selice on 2017/12/13.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCell : UITableViewCell
//头像
@property (nonatomic, strong) UIImageView *imagetitleview;
//标题
@property (nonatomic, strong) UILabel *title;
//时间
@property (nonatomic, strong) UILabel *time;
//区域
@property (nonatomic, strong) UILabel *zone;
//类型
@property (nonatomic, strong) UILabel *type;
//费用
@property (nonatomic, strong) UILabel *money;
//面积
@property (nonatomic, strong) UILabel *area;

@end
