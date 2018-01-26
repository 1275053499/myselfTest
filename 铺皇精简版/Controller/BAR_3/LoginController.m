//
//  LoginController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/16.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()<CAAnimationDelegate,UITextFieldDelegate>{
    UIButton          * BackBtn;
    UIView            * user_bgview;
    YJLPhoneTextField * user_name;
    UITextField       * user_cipher;
}

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * BImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    BImg.image = [UIImage imageNamed: @"user_img_1.jpg"];
    [self.view addSubview:BImg];
    [self Buildback];
    [self BuildUI];
    [self BUildother];
}

-(void)BUildother{
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, 235, self.view.frame.size.width-20, 37) backImageName:nil title:@"登录" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:19] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    UIButton *newUserBtn=[self createButtonFrame:CGRectMake(15, CGRectGetMaxY(landBtn.frame)+15, 60, 30) backImageName:nil title:@"快速注册" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(registration:)];
    
    UIButton *forgotPwdBtn=[self createButtonFrame:CGRectMake(KMW-75, CGRectGetMaxY(landBtn.frame)+15, 60, 30) backImageName:nil title:@"找回密码" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(fogetPwd:)];
   
    [self.view addSubview:landBtn];
    [self.view addSubview:newUserBtn];
    [self.view addSubview:forgotPwdBtn];
}


-(void)BuildUI{
    
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
    
  UISwipeGestureRecognizer * recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.view addGestureRecognizer:recognizer];
    

    user_bgview=[[UIView alloc]init];
    user_bgview.layer.cornerRadius=3.0;
    user_bgview.alpha=0.6;
    user_bgview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:user_bgview];
    [user_bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).with.offset(10);
        make.height.equalTo(@101);
        make.top.equalTo(BackBtn.mas_bottom).with.offset(30);
    }];

    user_name  = [[YJLPhoneTextField alloc]init];
    user_name.textAlignment = NSTextAlignmentLeft;
    user_name.placeholder = @"请输入手机号";
    user_name.font = [UIFont systemFontOfSize:14] ;
    user_name.textColor = MainRGB;
    user_name.borderStyle=UITextBorderStyleNone;
    user_name .clearButtonMode=UITextFieldViewModeWhileEditing;
    user_name.keyboardType = UIKeyboardTypeNumberPad;
    user_name.delegate = self;
    user_name.backgroundColor  = [UIColor clearColor];
    [user_bgview addSubview:user_name];
    [user_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(user_bgview).with.offset(10);
        make.left.equalTo(user_bgview).with.offset(50);
        make.right.equalTo(user_bgview).with.offset(-20);
        make.height.equalTo(@30);
    }];
//    账号头像
    UIImageView * user_name_ImageView = [self createImageViewFrame:CGRectMake(20, 10, 25, 25) imageName:@"name_icon" color:nil];
    [user_bgview addSubview:user_name_ImageView];
//    分割线
     UIImageView *line_name_cipher=[self createImageViewFrame:CGRectMake(20, 50, KMW - 60, 1) imageName:nil color:RGBA(180, 180, 180,0.5)];
     [user_bgview addSubview:line_name_cipher];
    
//密码
    user_cipher= [self createTextFielfFrame:CGRectMake(50, CGRectGetMaxY(line_name_cipher.frame)+10, KMW - 90, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"请输入密码" ];
    user_cipher.clearButtonMode  = UITextFieldViewModeWhileEditing;
    user_cipher.backgroundColor  = [UIColor clearColor];
    //密文样式
    user_cipher.secureTextEntry  = YES;
    user_cipher.delegate         = self;
    user_cipher.keyboardType     = UIKeyboardTypeDefault;
    [user_bgview addSubview:user_cipher];
//    密码头像
    UIImageView * user_cipher_ImageView = [self createImageViewFrame:CGRectMake(20, CGRectGetMaxY(line_name_cipher.frame)+10, 25, 25) imageName:@"Cipher_icon" color:nil];
    [user_bgview addSubview:user_cipher_ImageView];
}

//创建TextFiel 快捷
-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

//创建ImageView 快捷
-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}

//创建Button 快捷
-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}


//点击屏幕键盘下去 1
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer{
    
    [self.view endEditing:YES];
}

 - (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
     
     NSLog(@"swipe down");
     
     CATransition  *transition = [CATransition animation];//1.初始化
     transition.duration = 0.5f;//设置动画时长
     transition.delegate = self;//设置代理人
     transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//设置切换速度效果
     transition.type = kCATransitionPush;//动画切换风格
     transition.subtype = kCATransitionFromBottom;//动画切换方向
     [self.navigationController.view.layer addAnimation:transition forKey:nil];
     [self.navigationController popViewControllerAnimated:NO];
 }

//点击屏幕键盘下去 2
-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    
    [user_name resignFirstResponder];
    [user_cipher resignFirstResponder];
}

//点击屏幕键盘下去 3
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [user_name resignFirstResponder];
    [user_cipher resignFirstResponder];
}


#pragma -mark UITextField Delegate协议内容
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //textField放弃第一响应者 （收起键盘）
    //键盘是textField的第一响应者
    [user_cipher resignFirstResponder];
    [user_name resignFirstResponder];
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}


//限制最大输入字数限制
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    if (textField == user_name) {
        NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if ([toBeString length] > 13) {
            
            return NO;
        }
    }
    
    if([string hasSuffix:@" "])     // 忽视空格
        return NO;
    else
        return YES;
    return YES;
}


//登录
-(void)landClick{
    
     [self.view endEditing:YES];
    
    NSLog(@"%@",user_name.text);
    if ([user_name.text isEqualToString:@""]){

        [YJLHUD showWithmessage:@"亲,请输入用户名"];
        [YJLHUD dismissWithDelay:1.0f];
        return;
    }
    else if (user_name.text.length <11){
        
        [YJLHUD showWithmessage:@"您输入的手机号码格式不正确"];
        [YJLHUD dismissWithDelay:1.0f];
        return;
    }
    else if ([user_cipher.text isEqualToString:@""]){
       
        [YJLHUD showWithmessage:@"亲,请输入密码"];
        [YJLHUD dismissWithDelay:1.0f];
        return;
    }
    
    else if (user_cipher.text.length <6){
        
        [YJLHUD showWithmessage:@"亲,密码长度至少六位"];
        [YJLHUD dismissWithDelay:1.0f];
        return;
    }else{
        
        [YJLHUD showWithmessage:@"亲,可以验证登录了"];
        [YJLHUD dismissWithDelay:1.0f];
    }
    
}


//快速注册
-(void)registration:(UIButton *)button{

    CATransition  *transition = [CATransition animation];//1.初始化
    transition.duration = 0.5f;//设置动画时长
    transition.delegate = self;//设置代理人
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//设置切换速度效果
    transition.type = kCATransitionPush;//动画切换风格
    transition.subtype = kCATransitionFromRight;//动画切换方向
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
    [self.navigationController pushViewController:[RegistrationController new] animated:NO];
    self.hidesBottomBarWhenPushed = YES;
}

//忘记密码
-(void)fogetPwd:(UIButton *)button{
    
    [YJLHUD showWithmessage:@"忘记密码"];
    [YJLHUD dismissWithDelay:1.0f];
}

//创建返回键
-(void)Buildback{
    
    BackBtn                            = [UIButton buttonWithType:UIButtonTypeCustom];
    [BackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [BackBtn setTitle:@"取消" forState:UIControlStateNormal];
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
    transition.subtype = kCATransitionFromBottom;//动画切换方向
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
     [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
     NSLog(@"2_1");
}

@end
