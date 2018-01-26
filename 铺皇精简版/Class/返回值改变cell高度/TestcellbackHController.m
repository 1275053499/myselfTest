//
//  TestcellbackHController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/25.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "TestcellbackHController.h"

@interface TestcellbackHController ()<UITableViewDataSource,UITableViewDelegate>{
        UITableView * tableview;
        UILabel *testlab;
        NSInteger num;
}
//定义一个contentLabel文本高度的属性
@property (nonatomic,assign) CGFloat contentLabelH;
@end

@implementation TestcellbackHController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    num = 0;
    UIBarButtonItem *R2 =[UIBarButtonItem  rightbarButtonItemWithName:@"改变" highImage:nil target:self action:@selector(change)];
    self.navigationItem.rightBarButtonItems  = [NSArray arrayWithObjects:R2, nil];
    
    
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH)style:UITableViewStylePlain];
    tableview.delegate  =self;
    tableview.dataSource = self;
    tableview.estimatedRowHeight = 200;
    tableview.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableview];
    tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    testlab = [[UILabel alloc]init];
    testlab.textColor = [UIColor redColor];
    testlab.numberOfLines = 0;
    testlab.backgroundColor = [UIColor cyanColor];
    testlab.font =[UIFont systemFontOfSize:14];
    testlab.text = @"";
}

-(void)change{
    
    
    TestbackH_2Controller *ctl = [[TestbackH_2Controller alloc]init];
    self.hidesBottomBarWhenPushed = YES;//如果在push跳转时需要隐藏tabBar
    [self.navigationController pushViewController:ctl animated:YES];
    self.hidesBottomBarWhenPushed = NO;//1.并在push后设置self.hidesBottomBarWhenPushed=YES;2.这样back回来的时候，tabBar不会会恢复正常显示。
//    num = num+1;
//
//    switch (num) {
//        case 1:{
//
//             testlab.text = @"在开发中我们常常会遇到布局比较复杂的cell,在滑动的时候会导致界面不流畅，出现卡顿的现象，这是由于CPU计算和GPU渲染，之间未及时交换数据丢失帧导致的结果";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//        }
//            break;
//
//        case 2:{
//            testlab.text = @"当imageView的opque设置为YES的时候其alpha的属性就会无效";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//        }
//            break;
//
//        case 3:{
//            testlab.text = @"imageView的半透明取决于其图片半透明或者imageView本身的背景色合成的图层view是半透明的。如果图片全部不是半透明就不会触发图层的blend操作，整个图层就会不透明。如果叠加的图片有出现半透明的，就会立马触发图层的blend操作，整个图层不透明";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//        }
//            break;
//        case 4:{
//            testlab.text = @"点击添加跳转后在新的页面添加数据，完成之后返回本界面，这个时候array.count = 1；cell 的数量是2，然后我的想法是新添加的数据显示在@“添加人员信息”cell 的上面但是 实际返回这个页面之后新添加cell是在下面的想请教 怎么在页面返回之后刷新整个tableview  或者是怎样让新的cell添加在上面当某一块图层的alpha和其superView的背景色alpha不一样的时候会触发alpha合成操作，这是一项看似很简单但却是非常消耗CPU性能的操作。至于alpha叠加的概念如果有问题可以查看官方说法";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//        }
//            break;
//        case 5:{
//            testlab.text = @"UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//        }
//            break;
//        default:{
//
//            testlab.text = @"怎么在页面返回之后刷新整个tableview或者是怎样让新的cell添加在上面";
//            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
//
//                make.height.mas_equalTo(self.recordLabel_H);
//                //文本高度 我们再得到模型的时候 在传递
//            }];
//            [tableview reloadData];
//            num = 0;
//        }
//            break;
//    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"测试";
    [cell.contentView addSubview:testlab];
    
    [testlab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.contentView.mas_top).offset(0); //文本距离头像底部10个间距
        make.left.equalTo(cell.textLabel.mas_left).offset(75);  //文本距离左边的距离
        make.right.equalTo(cell.contentView.mas_right).offset(0);  //文本距离右边的距离
        make.height.mas_equalTo(self.recordLabel_H);
        //文本高度 我们再得到模型的时候 在传递
    }];
    cell.backgroundColor = [UIColor brownColor];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return self.recordLabel_H;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}


-(CGFloat)recordLabel_H{

        CGFloat h=[testlab.text boundingRectWithSize:CGSizeMake(KMW-100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
        _contentLabelH = h+10;  //内容距离底部下划线10的距离
    if (_contentLabelH<44) {
        return 44;
    }else{
        return _contentLabelH;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
    num = num+1;
    
    switch (num) {
        case 1:{
            
            testlab.text = @"在开发中我们常常会遇到布局比较复杂的cell,在滑动的时候会导致界面不流畅，出现卡顿的现象，这是由于CPU计算和GPU渲染，之间未及时交换数据丢失帧导致的结果";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
        }
            break;
            
        case 2:{
            testlab.text = @"当imageView的opque设置为YES的时候其alpha的属性就会无效";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
        }
            break;
            
        case 3:{
            testlab.text = @"imageView的半透明取决于其图片半透明或者imageView本身的背景色合成的图层view是半透明的。如果图片全部不是半透明就不会触发图层的blend操作，整个图层就会不透明。如果叠加的图片有出现半透明的，就会立马触发图层的blend操作，整个图层不透明";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
        }
            break;
        case 4:{
            testlab.text = @"点击添加跳转后在新的页面添加数据，完成之后返回本界面，这个时候array.count = 1；cell 的数量是2，然后我的想法是新添加的数据显示在@“添加人员信息”cell 的上面但是 实际返回这个页面之后新添加cell是在下面的想请教 怎么在页面返回之后刷新整个tableview  或者是怎样让新的cell添加在上面当某一块图层的alpha和其superView的背景色alpha不一样的时候会触发alpha合成操作，这是一项看似很简单但却是非常消耗CPU性能的操作。至于alpha叠加的概念如果有问题可以查看官方说法";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
        }
            break;
        case 5:{
            testlab.text = @"UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作UIView的背景色尽量不要设置为clearColor，这样也会触发alpha叠加，在tableView滑动的时候是非常消耗性能的。子视图的背景色尽可能设置成其superView的背景色，这样图层合成的时候不会触发blend操作";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
        }
            break;
        default:{
            
            testlab.text = @"怎么在页面返回之后刷新整个tableview或者是怎样让新的cell添加在上面";
            [testlab mas_remakeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(self.recordLabel_H);
                //文本高度 我们再得到模型的时候 在传递
            }];
            [tableview reloadData];
            num = 0;
        }
            break;
    }
    
}



@end
