//
//  FourthController.m
//  铺皇企业版
//
//  Created by selice on 2017/12/5.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "FourthController.h"

@interface FourthController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *maintableview;
}
@property (nonatomic,strong)NSMutableArray  *Arr;

@property(assign, nonatomic,getter=isMoon) BOOL moon;

@end

@implementation FourthController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"星期四";
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self testHUD];
    
    maintableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH)style:UITableViewStylePlain];
    maintableview.delegate   = self;
    maintableview.dataSource = self;
    maintableview.estimatedRowHeight = 200;
    maintableview.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:maintableview];
    maintableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSMutableArray *)Arr{
    if (_Arr == nil){
        _Arr = [[NSMutableArray alloc]initWithObjects:@[@"封装SVPHUD",@"cell动态高度",@"cell上UItextView动态高度",@"返回值改变cell高度",@"轮播图Web+Loca",@"夜间模式",@"物理碰撞现象",@"仿微信网页加载",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX",@"XXXX"],nil];
    }
    return _Arr;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //    NSLog(@"段=%ld",self.dataArray.count);
    return self.Arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    NSLog(@"列=%@",self.dataArray[section]);
    
    NSArray *arr = self.Arr[section];
    return arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"oneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
        NSArray *arr = self.Arr[indexPath.section];
        cell.textLabel.text = arr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44 ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //    NSLog(@"点击了第%ld段,第%ld个cell信息",indexPath.section,indexPath.row);
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
//                        [YJLHUD showWithmessage:@"Hello, pretty girl"];
//                        [YJLHUD showErrorWithmessage:@"error"];
//                        [YJLHUD showSuccessWithmessage:@"success"];
//                        [YJLHUD showInfoWithmessage:@"Info"];
//                        [YJLHUD showImage:[UIImage imageNamed:@"Home_1"] message:@"Hello, pretty girl"];//有图片 有文字
//                        [YJLHUD showImage:nil message:@"Hello, pretty girl"];//无图片 纯文字
//                        [YJLHUD showImage:[UIImage imageNamed:@"Home_1"] message:nil];// 有图片 纯文字
////                        [YJLHUD showProgress:0.0f message:@"Hello, pretty girl"];
//                        [YJLHUD showMyselfBackgroundColor:[UIColor redColor] ForegroundColor:[UIColor orangeColor] BackgroundLayerColor:[UIColor lightGrayColor] message:@"Hello, pretty girl"];
//                        [YJLHUD showMyselfBackgroundColor:nil ForegroundColor:nil BackgroundLayerColor:nil];
                        [YJLHUD showMyselfBackgroundColor:nil ForegroundColor:nil BackgroundLayerColor:nil message:@"加载中..."];
                    
                    [YJLHUD dismissWithDelay:1];
            
                }
                    break;
                    
                case 1:{
                    NSLog(@"cell自动高度");
                    GesbackController *ctl = [[GesbackController alloc]init];
                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    [self.navigationController pushViewController:ctl animated:YES];
                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设置self.hidesBottomBarWhenPushed=YES;2.这样back回来的时候，tabBar不会会恢复正常显示。
                    
                }break;
                case 2:{
                    NSLog(@"cell上UItextView动态高度");
                    TestCellWithUItextviewController *ctl = [[TestCellWithUItextviewController alloc]init];
                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    [self.navigationController pushViewController:ctl animated:YES];
                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设置self.hidesBottomBarWhenPushed=YES;2.这样back回来的时候，tabBar不会会恢复正常显示。
                }break;
                    
                case 3:{
                        NSLog(@"cell自动高度");
                        TestcellbackHController *ctl = [[TestcellbackHController alloc]init];
                        self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                        [self.navigationController pushViewController:ctl animated:YES];
                        self.hidesBottomBarWhenPushed = NO;//1.并在push后设置self.hidesBottomBarWhenPushed=YES;2.这样back回来的时候，tabBar不会会恢复正常显示。
                }break;
                    
                case 4:{
                    
                    NSLog(@"轮播图");
                    
                    ScrollowController *ctl = [[ScrollowController alloc]init];
                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    [self.navigationController pushViewController:ctl animated:YES];
                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }break;
                case 5:{
                   
                    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
                    if (!self.isMoon) {
                        self.moon = YES;
                        window.backgroundColor = [UIColor blackColor];
                        window.alpha = 0.5;
                    }
                    
                    else
                    {
                        self.moon = NO;
                        window.backgroundColor = [UIColor clearColor];
                        window.alpha = 1.0;
                    }
                    
                }break;
                    
                case 6:{
                    
                    YJLcollisionController *ctl = [[YJLcollisionController alloc]init];
                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    [self.navigationController pushViewController:ctl animated:YES];
                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 7:{
                    
                    YJLWKwebViewController *webView = [[YJLWKwebViewController alloc]initWithUrl:@"https://www.jianshu.com/u/97d851253618" andNavgationTitle:@"Tomorrow"];
                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    [self.navigationController pushViewController:webView animated:YES];
                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 8:{
                    
                   
//                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
//                    [self.navigationController pushViewController:webView animated:YES];
//                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 9:{
                    
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 10:{
                    
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 11:{
                    
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 12:{
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 13:{
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                case 14:{
                    
                    //                    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
                    //                    [self.navigationController pushViewController:webView animated:YES];
                    //                    self.hidesBottomBarWhenPushed = NO;//1.并在push后设
                    
                }
                    break;
                    
                default:{
                   
                }
                    break;
            }
        }
            break;
            
        default:
        {
        }
            break;
    }
}

#pragma -mark 测试SVPHUD
-(void)testHUD{
    
    UIBarButtonItem *R1 = [UIBarButtonItem leftbarButtonItemWithName:@"今天" highImage:nil target:self action:@selector(baicai)];
    UIBarButtonItem *R2 = [UIBarButtonItem leftbarButtonItemWithName:@"明天" highImage:nil target:self action:@selector(qingcai)];
    
    UIBarButtonItem *L1 = [UIBarButtonItem rightbarButtonItemWithImage:@"Home_1"  highImage:nil target:self action:@selector(baicai)];
    UIBarButtonItem *L2 =[UIBarButtonItem  rightbarButtonItemWithImage:@"Home_1"  highImage:nil target:self action:@selector(qingcai)];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:R1,R2, nil];
    self.navigationItem.rightBarButtonItems  = [NSArray arrayWithObjects:L1,L2, nil];
}

-(void)qingcai{
    
    NSLog(@"青菜");
}

-(void)baicai{
    
    NSLog(@"白菜");
}


@end
