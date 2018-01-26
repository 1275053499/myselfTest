//
//  FirstCell.m
//  铺皇精简版
//
//  Created by selice on 2017/12/13.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "FirstCell.h"

@implementation FirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


#define imgH 100//图像宽度
#define imgW 100//图像高度
#define img_lab 10//图像与文本间距
#define left_top_botton 10//外边距

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //头像
        self.imagetitleview  = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imagetitleview ];
        [self.imagetitleview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(left_top_botton);
            make.top.equalTo(self.contentView).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(imgW, imgH));
        }];
        
        //标题
        self.title = [[UILabel alloc]init];
        self.title.textColor = [UIColor blackColor];
        self.title.textAlignment = NSTextAlignmentLeft;
        self.title.font = [UIFont systemFontOfSize:14.0f];
        self.title.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).with.offset(left_top_botton);
            make.left.equalTo(self.imagetitleview.mas_right).with.offset(img_lab);
            make.size.mas_equalTo(CGSizeMake(KMW-left_top_botton-img_lab*2-imgW, 20));
        }];
        
        //区域
        self.zone = [[UILabel alloc]init];
        self.zone.textColor = RGB(85, 85, 85);
        self.zone.textAlignment = NSTextAlignmentCenter;
        self.zone.text = @"宝安区";
        self.zone.font = [UIFont systemFontOfSize:13.0f];
        self.zone.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.zone];
        [self.zone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).with.offset(20);
            make.left.equalTo(self.imagetitleview.mas_right).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(45, 20));
        }];
        
        
        //时间
        self.time = [[UILabel alloc]init];
        self.time.textColor =  RGB(85, 85, 85);
        self.time.textAlignment = NSTextAlignmentCenter;
        self.time.text = @"更新时间:2019-03-28";
        self.time.font = [UIFont systemFontOfSize:13.0f];
        self.time.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.time];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).with.offset(20);
            make.left.equalTo(self.zone.mas_right).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(140, 20));
        }];
        
        //类型
        self.type = [[UILabel alloc]init];
        self.type.textColor =  RGB(250, 141, 12);
        self.type.layer.borderColor  = [RGB(250, 141, 12) CGColor];
        self.type.layer.borderWidth  = 0.5f;
        self.type.layer.cornerRadius = 4.0f;
        self.type.textAlignment = NSTextAlignmentCenter;
        self.type.text = @"餐饮美食";
        self.type.font = [UIFont systemFontOfSize:13.0f];
        self.type.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.type];
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zone.mas_bottom).with.offset(25);
            make.left.equalTo(self.imagetitleview.mas_right).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(55, 15));
        }];
        
        //面积
        self.area = [[UILabel alloc]init];
        self.area.textColor =  RGB(77, 166, 214);
        self.area.layer.borderColor  = [RGB(77, 166, 214) CGColor];
        self.area.layer.borderWidth  = 0.5f;
        self.area.layer.cornerRadius = 4.0f;
        self.area.textAlignment = NSTextAlignmentCenter;
        self.area.text = @"1000m²";
        self.area.font = [UIFont systemFontOfSize:13.0f];
        self.area.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.area];
        [self.area mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zone.mas_bottom).with.offset(25);
            make.left.equalTo(self.type.mas_right).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(50, 15));
        }];
        
        //费用
        self.money = [[UILabel alloc]init];
        self.money.textColor =  RGB(214, 77, 77);
        self.money.textAlignment = NSTextAlignmentRight;
        self.money.text = @"10000000元/月";
        self.money.font = [UIFont systemFontOfSize:16.0f];
        self.money.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.money];
        [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zone.mas_bottom).with.offset(20);
            make.left.equalTo(self.area.mas_right).with.offset(left_top_botton);
            make.size.mas_equalTo(CGSizeMake(KMW-left_top_botton*5-imgW-105, 20));
        }];
    }
    
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
