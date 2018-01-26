//
//  VideoCell.h
//  铺皇精简版
//
//  Created by selice on 2017/12/14.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell
//头像
@property (nonatomic, strong) UIImageView * video_img;
//标题
@property (nonatomic, strong) UILabel     * video_title;
//时间
@property (nonatomic, strong) UILabel     * video_time;
@end
