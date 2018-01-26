//
//  SecondController.m
//  铺皇企业版
//
//  Created by selice on 2017/12/5.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "SecondController.h"

@interface SecondController ()<UITableViewDataSource,UITableViewDelegate>{
     UITableView     * Maintableview;/*Tableview*/
}

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"✨Tomorrow_S✨";
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [self BuildTable];          //创建tableview
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

#pragma -mark 导航栏变色事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"%f:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y>-14) {
        
        self.navigationController.navigationBar.barTintColor =MainRGB;
        
    }else{
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    }
}


#pragma mark - Tableviewdatasource代理 开始
//段落Section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

//当前段落Section 开发几个row（cell）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//cell 赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * mainT    = @[@"icon_tabbar_homepage_normal",@"icon_tabbar_merchant_normal",@"icon_tabbar_nearby_normal",@"icon_tabbar_mine_normal"];
    NSArray * Img      = @[@"icon_tabbar_homepage_normal",@"icon_tabbar_merchant_normal",@"icon_tabbar_nearby_normal",@"icon_tabbar_mine_normal"];
    NSArray * subT     = @[@"icon_tabbar_homepage_normal",@"icon_tabbar_merchant_normal",@"icon_tabbar_nearby_normal",@"icon_tabbar_mine_normal"];
   
    static NSString *ID = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
      
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.imageView.image      = [UIImage imageNamed:[NSString stringWithFormat:@"%@",Img[indexPath.section]]];
    cell.textLabel.text       = [NSString stringWithFormat:@"%@",mainT[indexPath.section]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",subT[indexPath.section]];
    cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;//跳转外形
    cell.selectionStyle       = UITableViewCellSelectionStyleNone;//被点击背景色
    return cell;
}

//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

//段头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            
            return 50;
        }
            break;
        default:{
            return 0.01f;
        }
            break;
    }
}
//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    switch (section) {
        case 3:{
            return 100;
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
    
    if (section == 3) {
            UIImageView *img = [[UIImageView alloc]init];
            img.image = [UIImage imageNamed:@"Header_T"];
        
        
            return img;
    }
    else{
        
        return nil;
    }
}

//段头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:{
            
            UILabel * Heade_title = [[UILabel alloc]init];
            Heade_title.text = @"    ✨✨选择您的需求类型✨✨";
            Heade_title.backgroundColor = [UIColor whiteColor];
            Heade_title.textAlignment = NSTextAlignmentLeft;
            Heade_title.textColor = RGB(85, 85, 85);
            Heade_title.font = [UIFont systemFontOfSize:18];
            return Heade_title;

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



#pragma - mark 获取手机类型( iPhone 6 Plus iPhone 6  iPhone 6s )
- (NSString*)deviceVersion{
    
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    
    return deviceString;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
     NSLog(@"当前手机类型:%@",[self deviceVersion]);
}

@end
