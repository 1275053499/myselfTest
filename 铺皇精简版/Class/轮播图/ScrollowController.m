//
//  ScrollowController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/26.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "ScrollowController.h"
#import "YJLScrollmg.h"
@interface ScrollowController ()<YJLscrollDelegate,UITableViewDelegate,UITableViewDataSource>{
    UITableView     * Maintableview;/*Tableview*/
}

@property (nonatomic , strong) YJLScrollmg    *  ScrollView_one;
@property (nonatomic , strong) YJLScrollmg    *  ScrollView_two;
@property (nonatomic , strong) YJLScrollmg    *  ScrollView_thr;
@property (nonatomic , strong) NSMutableArray * imageArr_one;
@property (nonatomic , strong) NSMutableArray * imageArr_two;
@property (nonatomic , strong) NSMutableArray * imageArr_thr;
@end

@implementation ScrollowController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"✨lsp✨";
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self BuildTable];          //创建tableview
    
    self.imageArr_one = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"Xunxian_1.jpeg"],[UIImage imageNamed:@"Xunxian_2.jpeg"],[UIImage imageNamed:@"Xunxian_3.jpeg"],[UIImage imageNamed:@"Xunxian_4.jpeg"],[UIImage imageNamed:@"Xunxian_5.jpeg"],[UIImage imageNamed:@"Xunxian_6.jpeg"],nil];
    
    self.imageArr_two = [NSMutableArray arrayWithObjects:
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514975384994&di=60105ecd27038e6bef33aebb092295eb&imgtype=0&src=http%3A%2F%2Fwww.0716fw.com%2Fuploadfile%2F2017%2F05%2F19%2F2017051908332458661iaods2.gif",
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514973696911&di=9b5135e4dc251b5adc598aeade72cc30&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Dd58983090af41bd5da53e8fc61db81a0%2F055cc91fbe096b635eb33a7208338744ebf8ac00.jpg",
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514975487611&di=7e71b64267ecc74b9a13b1ca0eee6dca&imgtype=0&src=http%3A%2F%2Fww1.sinaimg.cn%2Flarge%2F85cccab3tw1esjvv1k5nyg20dw0794qr.jpg",nil];
    
    self.imageArr_thr = [NSMutableArray arrayWithObjects:
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514977271647&di=ef7f6bfb56e4dd8f9e36265e7ae7217f&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farchive%2Fc8eecacd1960a466123aacca303fb46e2b5a41ec.jpg",
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514977339736&di=844a6e5d0fe0b2d7f075cffe4df2bb14&imgtype=0&src=http%3A%2F%2Fimgs.aixifan.com%2Fcontent%2F2016_07_29%2F1469780082.jpg",
                         @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514977399414&di=1c44df88f6154a963195c9bb50b8f299&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%253D580%2Fsign%3D3253b7f4d8b44aed594ebeec831d876a%2F2e25830e7bec54e7829aaea0bb389b504fc26a30.jpg",
                         nil];
    

    
}
#pragma mark - Tableview
-(void)BuildTable{
    
    Maintableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH) style:UITableViewStyleGrouped];
    Maintableview.rowHeight     = UITableViewAutomaticDimension;
    Maintableview.estimatedRowHeight = 44.0f;
    Maintableview.dataSource    = self;
    Maintableview.delegate      = self;
    Maintableview.tableFooterView = [UIView new];
    [Maintableview setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:Maintableview];
}

//cell 赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    switch (indexPath.section) {
        case 0:
        {
            cell.textLabel.text       = @"本地图片👆";
        }
            break;
        case 1:
        {
            cell.textLabel.text       = @"网络Gif图片👆";
        }
            break;
        case 2:
        {
            cell.textLabel.text       = @"网络静态图片👆";
        }
            break;
        default:
            break;
    }
    
    cell.selectionStyle       = UITableViewCellSelectionStyleNone;//被点击背景色
    return cell;
}

#pragma mark - Tableviewdatasource代理 开始
//段落Section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

//当前段落Section 开发几个row（cell）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 25;
}

//段头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            return 200;
        }
            break;
        case 1:{
            
            return 200;
        }
            break;
        case 2:{
            return 200;
        }
            break;
            
        default:{
            return 200;
        }
            break;
    }
}

//段头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
#pragma -mark 本地图片
            self.ScrollView_one                 = [[YJLScrollmg alloc] initWithFrame:CGRectMake(0, 0, KMW, 200)];
            self.ScrollView_one.backgroundColor = [UIColor whiteColor];
            self.ScrollView_one.yjlscrollDelegate = self;
            self.ScrollView_one.time = 2;
            [self.ScrollView_one setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor blackColor]];
            self.ScrollView_one.imageArray =self.imageArr_one;
            return self.ScrollView_one;
            
        }
            break;
        case 1:{
            
#pragma -mark 网络动态图片
            self.ScrollView_two                 = [[YJLScrollmg alloc] initWithFrame:CGRectMake(0, 0, KMW, 200)];
            self.ScrollView_two.backgroundColor = [UIColor whiteColor];
            self.ScrollView_two.yjlscrollDelegate = self;
            self.ScrollView_two.time = 4;
            [self.ScrollView_two setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor blackColor]];
            self.ScrollView_two.imageArray =self.imageArr_two;
            return self.ScrollView_two;
        }
            break;
            
        case 2:{
            
#pragma -mark 网络静态图片
            self.ScrollView_thr                 = [[YJLScrollmg alloc] initWithFrame:CGRectMake(0, 0, KMW, 200)];
            self.ScrollView_thr.backgroundColor = [UIColor whiteColor];
            self.ScrollView_thr.yjlscrollDelegate = self;
            self.ScrollView_thr.time = 1;
            [self.ScrollView_thr setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor blackColor]];
            self.ScrollView_thr.imageArray =self.imageArr_thr;
            return self.ScrollView_thr;
        }
            break;
            
        default:{
            
            return nil;
        }
            break;
    }
}

//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5;
}

//段尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}


//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld,%ld",(long)indexPath.section,(long)indexPath.row);
    [YJLHUD showWithmessage:[NSString stringWithFormat:@"第%ld段:第%ld列",indexPath.section,indexPath.row]];
    [YJLHUD dismissWithDelay:0.5f];
}

#pragma mark XRCarouselViewDelegate 轮播图代理
- (void)loopView:(YJLScrollmg *)ScrollView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}



@end
