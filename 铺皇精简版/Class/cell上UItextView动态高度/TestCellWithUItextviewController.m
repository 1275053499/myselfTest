//
//  TestCellWithUItextviewController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/23.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "TestCellWithUItextviewController.h"
#import "TestCellWithUItextViewCell.h"
@interface TestCellWithUItextviewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,TestCellWithUItextViewCellDelegate>{
    UITableView * _testtableview;
    NSString * _content;
    NSMutableArray * dataArray;
}


@end

@implementation TestCellWithUItextviewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _testtableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH)style:UITableViewStylePlain];
    _testtableview.delegate  =self;
    _testtableview.dataSource = self;
    _testtableview.estimatedRowHeight = 200;
    _testtableview.rowHeight = UITableViewAutomaticDimension;
     [self.view addSubview:_testtableview];
     _testtableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifer = @"cellIdentifier";
    TestCellWithUItextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell=[[TestCellWithUItextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.delegate=self;
    }
    cell.indexPath  =   indexPath;
    cell.tableView  =   _testtableview;
    cell.contentStr =   _content;
    return cell;
}

- (void)updatedText:(NSString *)text atIndexPath:(NSIndexPath *)indexPath{
    _content=text;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestCellWithUItextViewCell * cell = (TestCellWithUItextViewCell *)[tableView.dataSource tableView:_testtableview cellForRowAtIndexPath:indexPath];
    NSLog(@"%lf",[cell CellHeight]);
    if ([cell CellHeight]<44) {
        return 44;
    } else {
        return [cell CellHeight];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}



@end
