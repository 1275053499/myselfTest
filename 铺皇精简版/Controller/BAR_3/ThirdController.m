//
//  ThirdController.m
//  铺皇企业版
//
//  Created by selice on 2017/12/5.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "ThirdController.h"

@interface ThirdController ()<UITableViewDataSource,UITableViewDelegate,CAAnimationDelegate>{
    UITableView      * Maintableview;/*Tableview*/
    UIImageView      * UserImg;
    UIButton         * LoginBtn;
    UILabel          * Username;
    
}


@property(nonatomic,strong)UIView * HerderView;
@end

@implementation ThirdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"✨Tomorrow_P✨";
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    self.navigationController.navigationBar.barTintColor = MainRGBA(1);
    
     UIBarButtonItem *R2 =[UIBarButtonItem  rightbarButtonItemWithName:@"设置" highImage:nil target:self action:@selector(setting)];
     self.navigationItem.rightBarButtonItems  = [NSArray arrayWithObjects:R2, nil];
    
    UIBarButtonItem *L1 = [UIBarButtonItem leftbarButtonItemWithName:@"登录" highImage:nil target:self action:@selector(login)];
    
    UIBarButtonItem *L2 = [UIBarButtonItem leftbarButtonItemWithName:@"注销" highImage:nil target:self action:@selector(logout)];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:L1,L2, nil];
    
    [self BuildTable];          //创建tableview
    [self BuildHeaderview];
}

#pragma -mark 登录事件
-(void)login{

    [[YJLUserDefaults shareObjet]saveObject:@"login" forKey:YJLloginstate];
//    [YJLHUD showWithmessage:[NSString stringWithFormat:@"登录"]];
//    [YJLHUD dismissWithDelay:0.5f];
    [LoginBtn setHidden:YES];
    [UserImg  setHidden:NO];
    [Username setHidden:NO];
    UserImg.image               = [UIImage imageNamed:@"user_img_3.jpg"];
    Username.text = @"寻仙的等待";
}


#pragma -mark 注销事件
-(void)logout{
    
    [[YJLUserDefaults shareObjet]saveObject:@"logout" forKey:YJLloginstate];
//    [YJLHUD showWithmessage:[NSString stringWithFormat:@"注销"]];
//    [YJLHUD dismissWithDelay:0.5f];
    [LoginBtn setHidden:NO];
    [UserImg  setHidden:NO];
    [Username setHidden:YES];
    UserImg.image               = [UIImage imageNamed:@"user_img_2.jpg"];
    Username.text = @"XXXXX";
}

#pragma -mark 设置事件
-(void)setting{
    
//    [YJLHUD showWithmessage:[NSString stringWithFormat:@"设置"]];
//    [YJLHUD dismissWithDelay:0.5f];
    
    CATransition  *transition = [CATransition animation];//1.初始化
    transition.duration = 0.5f;//设置动画时长
    transition.delegate = self;//设置代理人
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];//设置切换速度效果
    transition.type = kCATransitionPush;//动画切换风格
    transition.subtype = kCATransitionFromTop;//动画切换方向
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
    [self.navigationController pushViewController:[LoginController new] animated:NO];
    self.hidesBottomBarWhenPushed = NO;
    

}

#pragma -mark 导航栏变色事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    NSLog(@"%f:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y>KMH/4-64) {
        
        self.navigationController.navigationBar.barTintColor =MainRGB;
       
    }else{
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:1 alpha:0.1];
    }
}


#pragma -mark 头部个人信息栏
-(void)BuildHeaderview{
    
        _HerderView = [[UIView alloc]init];
        _HerderView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"user_img_3.jpg"]];
        
        UserImg                     = [[UIImageView alloc]init];
        UserImg.layer.masksToBounds = YES;
        UserImg.layer.cornerRadius  =(KMH/4-60)/2.0f; //设置为图片宽度的一半出来为圆形
        UserImg.layer.borderWidth   = 2.0f; //边框宽度
        UserImg.layer.borderColor   = [[UIColor whiteColor] CGColor];//边框颜色
        [UserImg setHidden:NO];
        [_HerderView addSubview:UserImg];
        [UserImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_HerderView).with.offset(15);
            make.centerY.equalTo(_HerderView);
            make.size.mas_equalTo(CGSizeMake(KMH/4-60, KMH/4-60));
        }];
        
        Username = [[UILabel alloc]init];
        Username.textColor = [UIColor orangeColor];
        Username.textAlignment = NSTextAlignmentLeft;
        Username.backgroundColor = [UIColor clearColor];
        Username.adjustsFontSizeToFitWidth = YES;
        [Username setHidden:YES];
        [_HerderView addSubview:Username];
        [Username mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(UserImg);
            make.left.equalTo(UserImg.mas_right).with.offset(10);
            make.width.equalTo(@( KMW - 25- (KMH/4-60)-10));
            make.height.equalTo(@20);
            
        }];
        
        LoginBtn                            = [UIButton buttonWithType:UIButtonTypeCustom];
        [LoginBtn setTitle:@"登录／注册" forState:UIControlStateNormal];
        [LoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        LoginBtn.titleLabel.font            = [UIFont systemFontOfSize: 14.0];
        [LoginBtn setBackgroundColor:MainRGB];
        [LoginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [LoginBtn setHidden:NO];
        [_HerderView addSubview:LoginBtn];
        [LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(UserImg);
            make.right.equalTo(_HerderView).with.offset(-10);
            make.width.equalTo(@( KMW - 25- (KMH/4-60)-20));
            make.height.equalTo(@30);
        }];
}

#pragma mark - Tableview 创建
-(void)BuildTable{
    
    Maintableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH) style:UITableViewStyleGrouped];
    Maintableview.rowHeight     = UITableViewAutomaticDimension;
    Maintableview.estimatedRowHeight = 44.0f;
    Maintableview.dataSource    = self;
    Maintableview.delegate      = self;
    Maintableview.showsVerticalScrollIndicator =NO;
    Maintableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:Maintableview];
}

#pragma mark - Tableviewdatasource代理 开始
//段落Section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

//当前段落Section 开发几个row（cell）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return 4;
        }
            break;
            
        default:{
            return 2;
        }
            break;
    }
}


//cell 赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * mainT    =[[NSMutableArray alloc]initWithObjects:@[@"积分",@"服务",@"收藏",@"发布"],@[@"客服",@"分享"],nil];
    NSArray * Img      =[[NSMutableArray alloc]initWithObjects:@[@"icon_tabbar_homepage_normal",@"icon_tabbar_merchant_normal",@"icon_tabbar_nearby_normal",@"icon_tabbar_mine_normal"],@[@"icon_tabbar_homepage_normal",@"icon_tabbar_merchant_normal"],nil] ;
   
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    cell.imageView.image      = [UIImage imageNamed:[NSString stringWithFormat:@"%@",Img[indexPath.section][indexPath.row]]];
    cell.textLabel.text       = [NSString stringWithFormat:@"%@",mainT[indexPath.section][indexPath.row]];
    cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;//跳转外形
    cell.selectionStyle       = UITableViewCellSelectionStyleNone;//被点击背景色
    return cell;
}

//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

//段头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            
            return KMH/4;
        }
            break;
        default:{
            return 10;
        }
            break;
    }
}
//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            return 0.01f;
        }
            break;
        default:{
            return 0.01f;
        }
            break;
    }
}

//段尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
        return nil;
}
//段头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
    
            return self.HerderView;
            
        }
            break;
        case 1:{
            
            UIView * nilview = [[UIView alloc]init];
            nilview.backgroundColor = [UIColor groupTableViewBackgroundColor];
            return nilview;
            
        }
            break;
        default:{
            
            return nil;
        }
            break;
    }
}


//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld,%ld",(long)indexPath.section,(long)indexPath.row);
    [YJLHUD showWithmessage:[NSString stringWithFormat:@"第%ld段:第%ld列",indexPath.section,indexPath.row]];
    [YJLHUD dismissWithDelay:0.5f];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
   
    [self.tabBarController.tabBar setHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
  
    NSLog(@"%@",[[YJLUserDefaults shareObjet]getObjectformKey:YJLloginstate]);
    if ([[[YJLUserDefaults shareObjet]getObjectformKey:YJLloginstate] isEqualToString:@"login"]) {
        [self login];
    }else{
        [self logout];
    }
    
    NSLog(@"1_1");
}



@end
