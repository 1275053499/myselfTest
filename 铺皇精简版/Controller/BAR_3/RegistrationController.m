//
//  RegistrationController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/16.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "RegistrationController.h"

@interface RegistrationController ()<CAAnimationDelegate>{
    UIButton          * BackBtn;
}

@end

@implementation RegistrationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * BImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    BImg.image = [UIImage imageNamed: @"user_img_4.jpg"];
    [self.view addSubview:BImg];
    
     [self Buildback];
}

























//创建返回键
-(void)Buildback{
    
    BackBtn                            = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [BackBtn setTitle:@"登录" forState:UIControlStateNormal];
    BackBtn.titleLabel.font            = [UIFont systemFontOfSize: 18.0];
    [BackBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BackBtn];
    [BackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(self.view).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
}

#pragma 返回
-(void)back{
    
    CATransition  *transition = [CATransition animation];//1.初始化
    transition.duration = 0.5f;//设置动画时长
    transition.delegate = self;//设置代理人
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//设置切换速度效果
    transition.type = kCATransitionPush;//动画切换风格
    transition.subtype = kCATransitionFromLeft;//动画切换方向
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
