//
//  VideoCell.m
//  铺皇精简版
//
//  Created by selice on 2017/12/14.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //标题
        self.video_title = [[UILabel alloc]init];
        self.video_title.textColor = [UIColor blackColor];
        self.video_title.textAlignment = NSTextAlignmentLeft;
        self.video_title.text = @"寻仙大集锦";
        self.video_title.font = [UIFont systemFontOfSize:14.0f];
        self.video_title.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.video_title];
        [self.video_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).with.offset(10);
            make.left.equalTo(self.contentView).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(KMW-20-60, 20));
        }];
        
        //时间
        self.video_time = [[UILabel alloc]init];
        self.video_time.textColor = RGB(85, 85, 85);
        self.video_time.textAlignment = NSTextAlignmentRight;
        self.video_time.text = @"2017:11:29";
        self.video_time.font = [UIFont systemFontOfSize:14.0f];
        self.video_time.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:self.video_time];
        [self.video_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).with.offset(10);
            make.right.equalTo(self.contentView).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        //头像
        self.video_img  = [[UIImageView alloc]init];
        self.video_img.image = [UIImage imageNamed:@"Xunxian_24.jpeg"];
        self.video_img.contentMode = UIViewContentModeScaleAspectFill;
        self.video_img.clipsToBounds = YES;
        [self.contentView addSubview:self.video_img ];
        [self.video_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).with.offset(10);
            make.top.equalTo(self.video_title.mas_bottom).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(KMW-20, 200));
        }];
    }
    
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
