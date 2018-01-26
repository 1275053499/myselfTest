//
//  FirstController.m
//  铺皇企业版
//
//  Created by selice on 2017/12/5.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "FirstController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>//视频类
@interface FirstController ()<CDDRollingDelegate,ScrollImageDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{

    UIView          * Navview;/*自定义导航栏*/
    UIButton        * Citybtn;/*城市按钮*/
    UILabel         * Title;/*导航栏标题*/
    UIImageView     * cityimg;/*城市三角*/
    UIView          * Topview;/*tablew头部视图*/
    ScrollHeadView  * scrollView;/*轮播视图*/
    UITableView     * Maintableview;/*Tableview*/
    DCTitleRolling  * TTRollingview;/* 头条 */
    UIView          * BIGview;/*大数据*/
    UIView          * Selectview;/*精选*/
    UIView          * Classview;/*分类*/
    
     AVPlayerViewController  *YJLPlayer;                 //视频控件
    
    UIView *S2;
    UIView *S3;
    UIView *S4;
}

@property (nonatomic,strong)NSString * maincityid;
@property (nonatomic,strong)NSString * maincityname;
@property (nonatomic,strong)NSMutableArray  *dataSource;
@property (nonatomic,strong)NSMutableArray  *Videodatawebs;         //推荐视频地址数据源


@end

@implementation FirstController

- (NSMutableArray *)Videodatawebs{
    if (_Videodatawebs == nil){
        
        self.Videodatawebs = [[NSMutableArray alloc]initWithObjects:@[@"http://120.25.226.186:32812/resources/videos/minion_01.mp4",@"http://120.25.226.186:32812/resources/videos/minion_11.mp4"],nil];
    }
    
    return _Videodatawebs;
}

-(NSString *)maincityid{
    if (!_maincityid) {
        _maincityid = [NSString new];
    }
    return _maincityid;
}

-(NSString *)maincityname{
    if (!_maincityname) {
        _maincityname = [NSString new];
    }
    return _maincityname;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.title = @"Tomorrow_L";
     self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    //注册接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSeleted) name:@"TabBarDidSelectedNotificationTOFirstController" object:nil];

    [self BuildNav];            //创建导航栏
    [self BuildScroll_Btn];     //创建广告图 + 6个功能按钮
    [self BuildTable];          //创建tableview
    [self Buildrefresh];        //创建刷新控件
    [self BuildBigdata];     //创建大数据视图
    [self BuildDaydata];     //创建今日头条视图
    [self Buildselect];      //创建精选视图
    [self Buildclass];      //创建分类
    
}
#pragma -mark 处理点击了tabbar事件
-(void)tabBarSeleted{
    
    NSLog(@"处理一下点击事件先");
}

#pragma mark - MJRefresh 获取数据
-(void)LoadData{
    
    [YJLHUD showWithmessage:@"....刷新..."];
    [YJLHUD dismissWithDelay:0.5f];
    [Maintableview.mj_header endRefreshing];
}

#pragma mark - MJRefresh
-(void)Buildrefresh{
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadData)];
    Maintableview.mj_header              = header;
}

#pragma mark - Tableview
-(void)BuildTable{
    if (iOS11) {
        Maintableview               = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, KMW, KMH-29) style:UITableViewStyleGrouped];
    }else{
        Maintableview               = [[UITableView alloc]initWithFrame:CGRectMake(-0, -0, KMW, KMH-49) style:UITableViewStyleGrouped];
    }
    [Maintableview registerClass:[FirstCell class] forCellReuseIdentifier:@"FirstCell"];
    [Maintableview registerClass:[VideoCell class] forCellReuseIdentifier:@"VideoCell"];
    Maintableview.rowHeight     = UITableViewAutomaticDimension;
    Maintableview.estimatedRowHeight = 44.0f;
    Maintableview.dataSource    = self;
    Maintableview.delegate      = self;
    Maintableview.tableHeaderView = Topview;
    Maintableview.tableFooterView = [UIView new];
    Maintableview.showsHorizontalScrollIndicator = NO;
    Maintableview.showsVerticalScrollIndicator   = NO;
    [self.view addSubview:Maintableview];
    [self.view sendSubviewToBack:Maintableview];
    
}

#pragma mark - Tableviewdatasource代理 开始
//段落Section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 7;
}

//当前段落Section 开发几个row（cell）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
  switch (section) {
          
        case 2:{
             return 1;
        }
            break;
        case 3:{
             return 1;
        }
            break;
        case 4:{
             return 9;
        }
            break;
        case 5:{
            return 13;
        }
            break;
      case 6:{
          
          return 2;
      }
          break;
        default:{
             return 0;
        }
            break;
    }
}

//cell 赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
   
    switch (indexPath.section) {
            
        case 2:{
             [cell.contentView addSubview:Selectview];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;//被点击背景色
            return cell;
        }
            break;
        case 3:{
            [cell.contentView addSubview:Classview];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;//被点击背景色
            return cell;
        }
            break;
        case 4:{
        
            //                    fcell.zone.text = @"";
            //                    fcell.time.text = @"";
            //                    fcell.type.text = @"";
            //                    fcell.area.text = @"";
            //                    fcell.money.text = @"";
            
            NSArray * T    = @[@"Xunxian_背影",@"蓝凤凰",@"霸下怪兽",@"金焱梼杌王",@"天罡逐日鼋",@"白马",@"黑马",@"九尾妖狐",@"女儿国象"];
            NSArray * I    = @[@"Xunxian_背影.jpeg",@"蓝凤凰.jpeg",@"霸下怪兽.jpeg",@"金焱梼杌王.jpeg",@"天罡逐日鼋.jpg",@"白马.jpeg",@"黑马.jpeg",@"九尾妖狐.jpeg",@"女儿国象.jpeg"];
            FirstCell *fcell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
            fcell.title.text =[NSString stringWithFormat:@"%@",T[indexPath.row]];
            fcell.imagetitleview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",I[indexPath.row]]];
            fcell.selectionStyle = UITableViewCellSelectionStyleNone;//被点击背景色
            return fcell;
        }
            break;
       
        case 5:{
            
            NSArray * T    = @[@"Xunxian_背影.jpeg",@"Xunxian_1.jpeg",@"Xunxian_2.jpeg",@"Xunxian_3.jpeg",@"Xunxian_4.jpeg",@"Xunxian_5.jpeg",@"Xunxian_6.jpeg",@"Xunxian_7.jpeg",@"Xunxian_8.jpeg",@"Xunxian_9.jpeg",@"Xunxian_10.jpeg",@"Xunxian_11.jpeg",@"Xunxian_12.jpeg"];
            NSArray * I    = @[@"Xunxian_背影.jpeg",@"Xunxian_1.jpeg",@"Xunxian_2.jpeg",@"Xunxian_3.jpeg",@"Xunxian_4.jpeg",@"Xunxian_5.jpeg",@"Xunxian_6.jpeg",@"Xunxian_7.jpeg",@"Xunxian_8.jpeg",@"Xunxian_9.jpeg",@"Xunxian_10.jpeg",@"Xunxian_11.jpeg",@"Xunxian_12.jpeg"];
            
            FirstCell *fcell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
            fcell.title.text =[NSString stringWithFormat:@"%@",T[indexPath.row]];
            fcell.imagetitleview.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",I[indexPath.row]]];
            fcell.selectionStyle = UITableViewCellSelectionStyleNone;//被点击背景色
            return fcell;
        }
            break;

        case 6:{
            
            NSArray * T    = @[@"Xunxian_背影",@"Xunxian_12"];
            NSArray * I    = @[@"Xunxian_背影.jpeg",@"Xunxian_12.jpeg"];
            NSArray * t    = @[@"2017:01:03",@"2017:11:23"];
            VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
            cell.video_title.text = [NSString stringWithFormat:@"%@",T[indexPath.row]];
            cell.video_time.text  = [NSString stringWithFormat:@"%@",t[indexPath.row]];
            cell.video_img.image  = [UIImage imageNamed:[NSString stringWithFormat:@"%@",I[indexPath.row]]];
            cell.selectionStyle   = UITableViewCellSelectionStyleNone;//被点击背景色

            return cell;
        }
            break;
            
        default:{
        
            cell.imageView.image =[UIImage imageNamed:@"Xunxian_背影.jpeg"];
            cell.textLabel.text = [NSString stringWithFormat:@"第%ld段-第%ld列",indexPath.section,indexPath.row];
            cell.detailTextLabel.text = @"餐饮美食";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//
            cell.selectionStyle = UITableViewCellSelectionStyleNone;//被点击背景色
            return cell;
        }
            break;
    }
}


//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            return 44;
        }
        case 1:{
            return 44;
        }
        case 2:{
            return KMW/4+1;
        }
            break;
        case 3:{
            return 100;
        }
            break;
        case 4:{
            return 120;
        }
            break;
        case 5:{
            
            return 120;
        }
            break;
        case 6:{
            return 250;
        }
            break;
        default:{
            return 44.0f;
        }
            break;
    }
}

//段头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            return 45;
        }
            break;
        case 1:{
            return 44;
        }
            break;
        case 2:{
            return 40;
        }
            break;
        case 3:{
            return 40;
        }
            break;
        case 4:{
            return 113;
        }
            break;
        case 5:{
            return 113;
        }
            break;
        case 6:{
            return 113;
        }
            break;
        default:{
            return 999;
        }
            break;
    }
}


//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    switch (section) {
        case 0:{
            return 5;
        }
            break;
        case 1:{
            return 5;
        }
            break;
        case 2:{
            
            return 5;
        }
            break;
        case 3:{
            return 5;
        }
            break;
        case 4:{
            return 5;
        }
            break;
        case 5:{
            return 5;
        }
           break;
        case 6:{
            return 40;
        }
            break;
        default:{
             return 999;
        }
           break;
    }
}

//段尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 6) {
        UILabel * JXKD = [[UILabel alloc]init];
        JXKD.text = @"大侠,求放过啊!";
        JXKD.textAlignment = NSTextAlignmentCenter;
        JXKD.textColor = RGB(85, 85, 85);
        JXKD.font = [UIFont systemFontOfSize:12];
        return JXKD;
    }
    else{
        
        return nil;
    }
}

//段头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    switch (section) {
        case 0:{
            
            return BIGview;
        }
            break;
        case 1:{
            
            return TTRollingview;
        }
            break;
            
        case 2:{
            UILabel * JXKD = [[UILabel alloc]init];
            JXKD.text = @"- 精 选 开 店 -";
            JXKD.backgroundColor = [UIColor whiteColor];
            JXKD.textAlignment = NSTextAlignmentCenter;
            JXKD.textColor = RGB(0, 0, 0);
            JXKD.font = [UIFont systemFontOfSize:16];
            return JXKD;
        }
            break;
        case 3:{
            UILabel * FL = [[UILabel alloc]init];
            FL.backgroundColor = [UIColor whiteColor];
            FL.text = @"- 分 类 -";
            FL.textAlignment = NSTextAlignmentCenter;
            FL.textColor = RGB(0, 0, 0);
            FL.font = [UIFont systemFontOfSize:16];
            return FL;
        }
            break;
        case 4:{
            
            UIImageView *img = [[UIImageView alloc]init];
            img.image = [UIImage imageNamed:@"recommend_img"];
            //打开用户交互
            img.userInteractionEnabled =YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(RecoAction:)];
            //轻拍次数
            tap.numberOfTapsRequired = 1 ;
            //轻拍手指个数
            tap.numberOfTouchesRequired = 1;
            //讲手势添加到指定的视图上
            [img addGestureRecognizer:tap];
    
            return img;
        }
            break;
        case 5:{
            
            UIImageView *img = [[UIImageView alloc]init];
            img.image = [UIImage imageNamed:@"case_img"];
            //打开用户交互
            img.userInteractionEnabled =YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(CaseAction:)];
            //轻拍次数
            tap.numberOfTapsRequired = 1 ;
            //轻拍手指个数
            tap.numberOfTouchesRequired = 1;
            //讲手势添加到指定的视图上
            [img addGestureRecognizer:tap];
            return img;
        }
            break;
            
        case 6:{
            
            UIImageView *img = [[UIImageView alloc]init];
            img.image = [UIImage imageNamed:@"video_img"];
            //打开用户交互
            img.userInteractionEnabled =YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self     action:@selector(VideoAction:)];
            //轻拍次数
            tap.numberOfTapsRequired = 1 ;
            //轻拍手指个数
            tap.numberOfTouchesRequired = 1;
            //讲手势添加到指定的视图上
            [img addGestureRecognizer:tap];
            return img;
        }
            break;
        default:{
            
            return nil;
        }
            break;
    }
}
//推荐店铺点击
-(void)RecoAction:(UITapGestureRecognizer *)tap
{
    [YJLHUD showWithmessage:@"推荐店铺"];
    [YJLHUD dismissWithDelay:0.5f];
    NSLog(@"推荐店铺");
}
//最新案例点击
-(void)CaseAction:(UITapGestureRecognizer *)tap
{
    [YJLHUD showWithmessage:@"最新案例"];
    [YJLHUD dismissWithDelay:0.5f];
    NSLog(@"最新案例");
}


//视频点击
-(void)VideoAction:(UITapGestureRecognizer *)tap
{
    [YJLHUD showWithmessage:@"推荐视频"];
    [YJLHUD dismissWithDelay:0.5f];
    NSLog(@"推荐视频");
    
}

//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0||indexPath.section == 1||indexPath.section == 2||indexPath.section == 3) {
        
        NSLog(@"严进林");
    }
    
    else if (indexPath.section==6){
    
        //创建AVPlayerViewController控制器
        YJLPlayer = [[AVPlayerViewController alloc] init];
        YJLPlayer.player    = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:self.Videodatawebs[0][indexPath.row]]];
        NSLog(@"%@",self.Videodatawebs[0][indexPath.row]);
        YJLPlayer.view.frame = self.view.frame;
        //调用控制器的属性player的开始播放方法
        [self presentViewController:YJLPlayer animated:YES completion:nil];
        [YJLPlayer.player play];
    }
    
    else{
        
    [YJLHUD showWithmessage:[NSString stringWithFormat:@"第%ld段:第%ld列",indexPath.section,indexPath.row]];
    [YJLHUD dismissWithDelay:0.5f];
    
    }
}
#pragma mark - Tableviewdatasource代理 结束


#define Y_FL_B_W         (KMW-50)/4
#define Y_FL_B_H          20.0f     // 第一个按钮的Y坐标
#define Y_FL_B_Space      10.0f      // 2个按钮之间的横间距
#pragma - mark 创建分类视图
-(void)Buildclass{
    
    Classview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMW, 100)];
    Classview.backgroundColor = [UIColor whiteColor];
    
     NSArray *Y_FL_B_title_1    = @[@"餐饮美食",@"美容美发",@"服饰鞋包",@"休闲娱乐"];
     NSArray *Y_FL_B_title_2    = @[@"百货超市",@"生活服务",@"电子通讯",@"汽车服务"];
     NSArray *Y_FL_B_title_3    = @[@"医疗保健",@"家居建材",@"教育培训",@"酒店宾馆"];
    
     for (int i = 0; i <= 3; i++) {
         
         UIButton *Y_FL_B = [UIButton buttonWithType:UIButtonTypeCustom];
         [Y_FL_B setTitle:[NSString stringWithFormat:@"%@",Y_FL_B_title_1[i]] forState:UIControlStateNormal];
         [Y_FL_B addTarget:self action:@selector(Class:) forControlEvents:UIControlEventTouchUpInside];
         [Y_FL_B setTitleColor:RGB(85, 85, 85) forState:UIControlStateNormal];
         Y_FL_B.backgroundColor = MainRGBA(0.6);
         Y_FL_B.frame = CGRectMake(Y_FL_B_Space+(Y_FL_B_W+Y_FL_B_Space)*i, Y_FL_B_Space, Y_FL_B_W, Y_FL_B_H);
         Y_FL_B.titleLabel.font     = [UIFont boldSystemFontOfSize:14];
         Y_FL_B.layer.cornerRadius = 4.0f;
         Y_FL_B.tag = i;
         [Classview addSubview:Y_FL_B];
     }
    
    for (int i = 0; i <= 3; i++) {
        
        UIButton *Y_FL_B = [UIButton buttonWithType:UIButtonTypeCustom];
        [Y_FL_B setTitle:[NSString stringWithFormat:@"%@",Y_FL_B_title_2[i]] forState:UIControlStateNormal];
        [Y_FL_B addTarget:self action:@selector(Class:) forControlEvents:UIControlEventTouchUpInside];
        [Y_FL_B setTitleColor:RGB(85, 85, 85) forState:UIControlStateNormal];
        Y_FL_B.frame = CGRectMake(Y_FL_B_Space+(Y_FL_B_W+Y_FL_B_Space)*i, Y_FL_B_Space*2+Y_FL_B_H, Y_FL_B_W, Y_FL_B_H);
       Y_FL_B.backgroundColor = MainRGBA(0.6);
        Y_FL_B.titleLabel.font     = [UIFont boldSystemFontOfSize:14];
        Y_FL_B.layer.cornerRadius = 4.0f;
        Y_FL_B.tag = i+4;
        [Classview addSubview:Y_FL_B];
    }
    
    for (int i = 0; i <= 3; i++) {
        UIButton *Y_FL_B = [UIButton buttonWithType:UIButtonTypeCustom];
        [Y_FL_B setTitle:[NSString stringWithFormat:@"%@",Y_FL_B_title_3[i]] forState:UIControlStateNormal];
        [Y_FL_B addTarget:self action:@selector(Class:) forControlEvents:UIControlEventTouchUpInside];
        [Y_FL_B setTitleColor:RGB(85, 85, 85) forState:UIControlStateNormal];
        Y_FL_B.backgroundColor = MainRGBA(0.6);
        Y_FL_B.frame = CGRectMake(Y_FL_B_Space+(Y_FL_B_W+Y_FL_B_Space)*i, Y_FL_B_Space*3+Y_FL_B_H*2, Y_FL_B_W, Y_FL_B_H);
        Y_FL_B.titleLabel.font     = [UIFont boldSystemFontOfSize:14];
        Y_FL_B.layer.cornerRadius = 4.0f;
        Y_FL_B.tag = i+8;
        [Classview addSubview:Y_FL_B];
    }
    
}

#pragma - mark 分类事件
-(void)Class:(UIButton *)sender{
    switch (sender.tag) {
        case 0:{
            
            [YJLHUD showWithmessage:@"餐饮美食"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 1:{
           
            [YJLHUD showWithmessage:@"美容美发"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 2:{
           
            [YJLHUD showWithmessage:@"服饰鞋包"];
            [YJLHUD dismissWithDelay:0.5f];
        }
        case 3:{
            
            [YJLHUD showWithmessage:@"休闲娱乐"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 4:{
           
            [YJLHUD showWithmessage:@"百货超市"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
      
        case 5:{
           
            [YJLHUD showWithmessage:@"生活服务"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 6:{
           
            [YJLHUD showWithmessage:@"电子通讯"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 7:{
            
            [YJLHUD showWithmessage:@"汽车服务"];
            [YJLHUD dismissWithDelay:0.5f];
        }
        case 8:{
           
            [YJLHUD showWithmessage:@"医疗保健"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 9:{
            
            [YJLHUD showWithmessage:@"家居建材"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 10:{
           
            [YJLHUD showWithmessage:@"教育培训"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        default:{
            
            [YJLHUD showWithmessage:@"酒店宾馆"];
            [YJLHUD dismissWithDelay:0.5f];
           
        }
            break;
    }
}


#pragma - mark 创建精选视图
-(void)Buildselect{
    
    Selectview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMW/4+1)];
    Selectview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    NSArray *Btnimg     = @[@"QYXD",@"SHMJ",@"DJDP",@"ZJXD"];
    NSArray *Btnname    = @[@"区域选店",@"适合面积",@"低价店铺",@"租金选店"];
    for (int i = 0; i <= 3; i++) {
        
        FSCustomButton *Y_Select_B      = [[FSCustomButton alloc] initWithFrame:CGRectMake(((KMW-3)/4+1)*i, 1, (KMW-3)/4, KMW/4)];
        Y_Select_B.adjustsTitleTintColorAutomatically = YES;
        [Y_Select_B setTintColor:RGB(27, 31, 35)];
        Y_Select_B.titleLabel.font     = [UIFont boldSystemFontOfSize:12];
        [Y_Select_B setTitle:[NSString stringWithFormat:@"%@",Btnname[i]] forState:UIControlStateNormal];
        [Y_Select_B setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Btnimg[i]]] forState:UIControlStateNormal];
        Y_Select_B.layer.cornerRadius  = 0;
        Y_Select_B.backgroundColor = [UIColor whiteColor];
        Y_Select_B.buttonImagePosition = FSCustomButtonImagePositionBottom;
        Y_Select_B.titleEdgeInsets     = UIEdgeInsetsMake(0, 0, 10, 0);
        [Y_Select_B addTarget:self action:@selector(Select:) forControlEvents:UIControlEventTouchUpInside];
        Y_Select_B.tag                 = i;
        [Selectview addSubview:Y_Select_B];
        
    }
}

#pragma - mark 精选事件
-(void)Select:(UIButton *)sender{
    switch (sender.tag) {
        case 0:{
            NSLog(@"000");
            [YJLHUD showWithmessage:@"区域选店"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 1:{
            NSLog(@"111");
            [YJLHUD showWithmessage:@"适合面积"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        case 2:{
            NSLog(@"222");
            [YJLHUD showWithmessage:@"低价店铺"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
        default:{
             NSLog(@"333");
            [YJLHUD showWithmessage:@"租金选店"];
            [YJLHUD dismissWithDelay:0.5f];
        }
            break;
    }
}

#pragma -mark 创建今日头条
-(void)BuildDaydata{
    
    TTRollingview = [[DCTitleRolling alloc]initWithFrame:CGRectMake(0, 0, KMW, 44) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder){
        
        *rollingTime = 0.2;
        *rolTags = @[@"South Korea",@"France",@"China"];
        *rolTitles = @[@"✨韩国车模的拍照秘籍",@"✨2000部高清视频，总有你喜欢的",@"✨只要998，随便带回家"];
        *leftImage = @"img_toutiao";
        *rightbuttonTitle = @"更多";
        *interval = 3.0;
        *titleFont = 12;
        *titleColor = [UIColor darkGrayColor];
    }];
    
    TTRollingview.moreClickBlock = ^{
        NSLog(@"更多");
        [YJLHUD showWithmessage:@"测试版本不开放功能"];
        [YJLHUD dismissWithDelay:0.5f];
    };
    
    [TTRollingview dc_beginRolling];
    TTRollingview.delegate           = self;//设置代理进行点击事件判断
    TTRollingview.layer.cornerRadius = 0;
    [TTRollingview.layer masksToBounds];
    TTRollingview.backgroundColor    = [UIColor whiteColor];
}

#pragma mark - <CDDRollingDelegate>
- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index{

     [YJLHUD showWithmessage:[NSString stringWithFormat:@"点击第%zd个头条\n测试版本不开放功能",index]];
     [YJLHUD dismissWithDelay:0.5f];
}

#pragma -mark 大数据创建
-(void)BuildBigdata{

    BIGview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, KMW, 45)];
    BIGview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [BIGview addSubview:[YJLILLview initWithFrame:CGRectMake(0, 1,(KMW-2)/3, 44) Leftimage:[UIImage imageNamed:@"Big_1"] Maintitle:@"找店量" Subtitle:@"4000" imageW:40 imageH:40]];
    [BIGview addSubview:[YJLILLview initWithFrame:CGRectMake((KMW-2)/3+1, 1, (KMW-2)/3, 44) Leftimage:[UIImage imageNamed:@"Big_2"] Maintitle:@"成交量" Subtitle:@"1615" imageW:40 imageH:40]];
    [BIGview addSubview:[YJLILLview initWithFrame:CGRectMake(((KMW-2)/3+1)*2, 1, (KMW-2)/3, 44) Leftimage:[UIImage imageNamed:@"Big_3"] Maintitle:@"转店量" Subtitle:@"2425" imageW:40 imageH:40]];
}

#pragma -mark-创建广告图 + 6个功能按钮
-(void)BuildScroll_Btn{
    //    table 的   headerview
    Topview = [UIView new];
    Topview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    Topview.frame = CGRectMake(0, 0, KMW, 394);
    
    //    广告图位置
    NSMutableArray *IMG = [NSMutableArray arrayWithObjects:@"banner_3",@"banner_1",@"banner_2",@"banner_3",@"banner_1",nil];
    scrollView = [[ScrollHeadView alloc]initWithFrame:CGRectMake( 0 , 0 , KMW, 194) arraySource:IMG];
    self.automaticallyAdjustsScrollViewInsets = NO;     //ios7 之后必写这句不然图片会跑出范围
    scrollView.nav = self.navigationController;         //用于点击图片跳转使用
    [Topview addSubview:scrollView];
    
    //    6个按钮的位置
    UIView *Topmidview = [UIView new];
    Topmidview.backgroundColor = [UIColor whiteColor];
    Topmidview.frame = CGRectMake(0, 194, KMW, 200);
    [Topview addSubview:Topmidview];
    
    NSArray *Btnimg1     = @[@"地图选铺",@"店铺转让",@"商铺选址"];
    NSArray *Btnname1    = @[@"地图选铺",@"商铺转让",@"商铺选址"];
    
    NSArray *Btnimg2     = @[@"出租招商",@"招聘中心",@"开店服务"];
    NSArray *Btnname2    = @[@"出租招商",@"招聘中心",@"开店服务"];
    for (int i = 0; i <= 2; i++) {
        
        FSCustomButton *Y_six_B      = [[FSCustomButton alloc] initWithFrame:CGRectMake(KMW/3*i, 0, KMW/3, 100)];
        Y_six_B.adjustsTitleTintColorAutomatically = YES;
        [Y_six_B setTintColor:RGB(27, 31, 35)];
        Y_six_B.titleLabel.font     = [UIFont boldSystemFontOfSize:14];
        [Y_six_B setTitle:[NSString stringWithFormat:@"%@",Btnname1[i]] forState:UIControlStateNormal];
        [Y_six_B setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Btnimg1[i]]] forState:UIControlStateNormal];
        Y_six_B.layer.cornerRadius  = 4;
        Y_six_B.buttonImagePosition = FSCustomButtonImagePositionTop;
        Y_six_B.titleEdgeInsets     = UIEdgeInsetsMake(10, 0, 0, 0);
        [Y_six_B addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        Y_six_B.tag                 = i+1;
        [Topmidview addSubview:Y_six_B];
        
    }
    
    for (int i = 0; i <=2; i++) {
        
        FSCustomButton *Y_six_B = [[FSCustomButton alloc] initWithFrame:CGRectMake(KMW/3*i, 100, KMW/3, 100)];
        Y_six_B.adjustsTitleTintColorAutomatically = YES;
        [Y_six_B setTintColor:RGB(27, 31, 35)];
        Y_six_B.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [Y_six_B setTitle:[NSString stringWithFormat:@"%@",Btnname2[i]] forState:UIControlStateNormal];
        [Y_six_B setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Btnimg2[i]]] forState:UIControlStateNormal];
        Y_six_B.layer.cornerRadius = 4;
        Y_six_B.buttonImagePosition = FSCustomButtonImagePositionTop;
        Y_six_B.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0);
        [Y_six_B addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        Y_six_B.tag = i+4;
        [Topmidview addSubview:Y_six_B];
    }
}

#pragma -mark 转让，选址，选铺，出租，招聘，开店 点击事件
-(void)click:(UIButton *)btn {
    
     switch (btn.tag) {
         case 1:{
             NSLog(@"11111111");
             [YJLHUD showWithmessage:@"地图选铺"];
             [YJLHUD dismissWithDelay:0.5f];
             
         }break;
         case 2:{
             
             NSLog(@"22222222");
             [YJLHUD showWithmessage:@"商铺转让"];
             [YJLHUD dismissWithDelay:0.5f];
         }break;
         case 3:{
             
             NSLog(@"3333333");
             [YJLHUD showWithmessage:@"商铺选址"];
             [YJLHUD dismissWithDelay:0.5f];
         }break;
         case 4:{
             
             NSLog(@"44444444");
             [YJLHUD showWithmessage:@"出租招商"];
             [YJLHUD dismissWithDelay:0.5f];
         }break;
         case 5:{
             NSLog(@"555555");
             [YJLHUD showWithmessage:@"招聘中心"];
             [YJLHUD dismissWithDelay:0.5f];
             
         }break;
         case 6:{
             
             NSLog(@"6666666");
             [YJLHUD showWithmessage:@"开店服务"];
             [YJLHUD dismissWithDelay:0.5f];
         }break;
             
     }
}


#pragma -mark 自定义导航栏
-(void)BuildNav{
    
     __weak typeof(self) weakSelf = self;
    
    Navview = [UIView new];
    [weakSelf.view addSubview:Navview];
    [weakSelf.view bringSubviewToFront:Navview];
    Navview.backgroundColor =[UIColor clearColor];
    [Navview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).with.offset(0);
        make.top.equalTo(weakSelf.view).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(KMW, 64));
    }];
    
    Citybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Citybtn.titleLabel.font             = [UIFont systemFontOfSize:14.0f];
    Citybtn.contentHorizontalAlignment  = UIControlContentHorizontalAlignmentRight;
    [Citybtn setTitle:@"深圳市" forState:UIControlStateNormal];
    [Citybtn setBackgroundColor: [UIColor clearColor]];
    [Citybtn addTarget:self action:@selector(citychange:) forControlEvents:UIControlEventTouchUpInside];
    [Navview addSubview:Citybtn];
    [Citybtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(Navview).with.offset(20);
         make.left.equalTo(Navview).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(KMW/5, 44));
    }];
    
    cityimg = [UIImageView new];
    cityimg.image =[UIImage imageNamed:@"city"];
    [Navview addSubview:cityimg];
    [cityimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Citybtn);
        make.left.equalTo(Citybtn.mas_right).with.offset(0);
         make.size.mas_equalTo(CGSizeMake(9, 5));
    }];
    
    Title  = [UILabel new];
    Title.text= @"✨✨Tomorrow_L✨✨";
    Title.backgroundColor = [UIColor clearColor];
    Title.textAlignment = NSTextAlignmentCenter;
    Title.textColor = RGB(255, 255, 255);
    Title.font = [UIFont systemFontOfSize:16.0f];
    [Navview addSubview:Title];
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Navview).with.offset(20);
        make.left.equalTo(cityimg.mas_right).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(KMW/5*3-18, 44));
    }];
}

#pragma  mark 跳转城市选择
-(void)citychange:(id)sender{
    NSLog(@"选址城市");
    CitychangeController *ctl = [[CitychangeController alloc]init];
  
    ctl.returnCityBlock =^(NSString *cityname, NSString *cityid){
        [Citybtn setTitle:cityname forState:UIControlStateNormal];
        _maincityid = cityid;
        NSLog(@"%@",cityid);
        NSLog(@"%@",_maincityid);
        
    };
   
    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
    [self.navigationController pushViewController:ctl animated:YES];
    self.hidesBottomBarWhenPushed = NO;//1.并在push后设置self.hidesBottomBarWhenPushed=YES;2.这样back回来的时候，tabBar不会会恢复正常显示。
}


#pragma  mark 其它技术支持
// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

#pragma -mark 导航栏透明度变化
// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //    判断滑动到是Mainscrollow
    if (scrollView == Maintableview){
        
        CGFloat offset = scrollView.contentOffset.y;
        
        if (offset  >  44 ){
            //    根据滑动的距离增加透明度
            CGFloat alpha = MIN(1, offset / 88);
            Navview.backgroundColor = MainRGBA(alpha);
        }else{
            Navview.backgroundColor = MainRGBA(0);
        }
        
        //    设置下拉的时候能够隐藏掉搜索框
        if (offset < - 64) {
            Navview.hidden = YES;
        }else{
            Navview.hidden = NO;
        }
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
