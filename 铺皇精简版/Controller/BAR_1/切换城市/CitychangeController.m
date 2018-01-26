//
//  CitychangeController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/8.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "CitychangeController.h"

@interface CitychangeController (){
    UILabel *aleartTop;
    UILabel *aleartEnd;
    UIButton * SZcity;
    UIButton * GZcity;
}

@end

@implementation CitychangeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"城市选择";
    self.view.backgroundColor = [UIColor whiteColor];
    [self Buildcicylist];
}


-(void)Buildcicylist{
    
        aleartTop  = [UILabel new];
        aleartTop.text= @"当前支持城市";
        aleartTop.backgroundColor = [UIColor whiteColor];
        aleartTop.textAlignment = NSTextAlignmentLeft;
        aleartTop.textColor = RGB(161, 161, 161);
        aleartTop.font = [UIFont systemFontOfSize:12.0f];
        [self.view addSubview:aleartTop];
        [aleartTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).with.offset(74);
            make.left.equalTo(self.view).with.offset(20);
            make.size.mas_equalTo(CGSizeMake(KMW-40, 20));
        }];
    
    
        SZcity = [UIButton buttonWithType:UIButtonTypeCustom];
        SZcity.tag = 10;
        SZcity.titleLabel.font     = [UIFont systemFontOfSize:14.0f];
        [SZcity setBackgroundColor:[UIColor whiteColor]];
        [SZcity setTitleColor:RGB(77, 166, 214) forState:UIControlStateNormal];
        [SZcity setTitle:@"深圳市" forState:UIControlStateNormal];
        [SZcity addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:SZcity];
        [SZcity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(aleartTop).with.offset(30);
            make.left.equalTo(self.view).with.offset(10);
            make.size.mas_equalTo(CGSizeMake((KMW-40)/3, 25));
        }];
    
    
        GZcity = [UIButton buttonWithType:UIButtonTypeCustom];
        GZcity.tag = 20;
        GZcity.titleLabel.font     = [UIFont systemFontOfSize:14.0f];
        [GZcity setBackgroundColor:[UIColor whiteColor]];
        [GZcity setTitleColor:RGB(77, 166, 214) forState:UIControlStateNormal];
        [GZcity setTitle:@"广州市" forState:UIControlStateNormal];
        [GZcity addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:GZcity];
        [GZcity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(aleartTop).with.offset(30);
            make.left.equalTo(SZcity.mas_right).with.offset(10);
            make.size.mas_equalTo(CGSizeMake((KMW-40)/3, 25));
        }];
    
        aleartEnd  = [UILabel new];
        aleartEnd.backgroundColor = [UIColor whiteColor];
        aleartEnd.text= @"其他城市正在拓展业务中，请持续关注动态...";
        aleartEnd.textAlignment = NSTextAlignmentLeft;
        aleartEnd.textColor = RGB(161, 161, 161);
        aleartEnd.font = [UIFont systemFontOfSize:12.0f];
        [self.view addSubview:aleartEnd];
        [aleartEnd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(SZcity.mas_bottom).with.offset(10);
            make.left.equalTo(self.view).with.offset(20);
            make.size.mas_equalTo(CGSizeMake(KMW-40, 20));
        }];
}

-(void)choose:(UIButton *)city{
    
    if (city.tag == 10) {//深圳
        
        NSString *cityname = @"深圳市";
        NSString *cityid= @"291";
        __weak typeof(self) weakself = self;
        
        if (weakself.returnCityBlock) {
            //将自己的值传出去，完成传值
            weakself.returnCityBlock(cityname,cityid);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{//20 广州
        
        NSString *cityname = @"广州市";
        NSString *cityid= @"289";
        __weak typeof(self) weakself = self;
        
        if (weakself.returnCityBlock) {
            //将自己的值传出去，完成传值
            weakself.returnCityBlock(cityname,cityid);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
