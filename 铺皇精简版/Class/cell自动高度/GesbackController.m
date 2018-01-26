//
//  GesbackController.m
//  铺皇精简版
//
//  Created by selice on 2017/12/8.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "GesbackController.h"
#import "RecordModel.h"
#import "RecordViewCell.h"
/*状态栏加导航栏高度*/

#define NAVGATION_ADD_STATUS_HEIGHT (STATUS_HEIGHT + NAVGATION_HEIGHT)
#define NumberRow 4 //  设置每行显示的图片数量
#define CollClearance 3 //  图片据上下两边的宽度
#define ImageWidthMargin 3  //    图片据左右两边的宽度

@interface GesbackController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *arr; //存放的我们自定义的数据
@property (nonatomic,strong) NSMutableArray *arrModel; //存放的数据模型

@property (nonatomic,strong) NSMutableArray *arrimg;
@end

@implementation GesbackController

-(NSMutableArray *)arr
{
    if(_arr==nil){
        _arr=[NSMutableArray array];
        
        [_arr addObject:@"大侄女来家里了，吃过晚饭，我姐洗好了水果，大侄女端出来，说我是长辈先拿，刚一伸手，大侄女拍我手：“让你先拿你就拿，怪不得单身，下次一定要记住，女士优先 ！！！说着拿个最大的苹果开心的走了！！！"];
        
        [_arr addObject:@"老公想喝水催促女儿说“快给爸爸倒水，爸爸噎着了。”催了两遍宝贝不动，又说“快，爸爸噎得不行了！”女儿瞟了他一眼悠悠拿起水杯说“噎住了说话还这么快，骗小孩呢？"];
        
        [_arr addObject:@"小男孩问爸爸：“什么是真正的男子汉呀？”爸爸回答：“一个能够承担起家庭责任，照顾好他的家人的人就是男子汉。”然后小男孩接着说：“那我有一天要成为妈妈那样的人。”"];
        
        [_arr addObject:@"儿子天天玩的都很开心，就问：为什么你天天都那么开心呐？儿子想了想，道：还用说，没老婆呗！"];
        
        [_arr addObject:@"佛堂中，大师正在对弟子讲话：“为师为你们所起之名并非随随便便，而是为师对你们的期望，你们懂了吗？”众弟子都回答懂了。只有一名弟子默然不语。大师见状，问那名弟子道：“圆寂，你为什么不说话?"];
        
        [_arr addObject:@"看小侄子的日记，大致内容如下：今天我跟小红玩过家家，我们从厕所弄了一点屎当做蛋糕，给小红过生日，等我们唱完生日歌她竟然当做真的蛋糕一下呼我脸上了，我决定跟她绝交，我恨她！"];
        
        [_arr addObject:@"今天和老婆吵架,吵到激烈的时候,我突然觉得我一个大男人为什么要和一个女人一般见识呢?何况还是自己的老婆!当时我就跟老婆道了歉,老婆挺高兴的.道完歉,她哥哥把菜刀放下了,她弟弟把铁锹也放下了,她妹妹拽着我头发的手也松开了,妹夫手里的擀面杖也扔地下了,老丈人也把砖头丢开了;"];
        
        [_arr addObject:@"昨天去一家工厂面试监工，给出的工资太低，简直不能忍。最后跟主管去车间看了看，我觉得工资只是数字而已，关键是学习的机会，所以留下来了。"];
        
        [_arr addObject:@"大家好，我是他主治医生。请原谅他，他因为神经病引起的并发症迷恋上了装逼，去年高考 ，他差一点就上清华了，现在想来依然倍感惋惜，清华分数695，他考了69.5，就差那么一点。巨大的打击彻底粉碎了他对未来的憧憬，整日在家自暴自弃专研怎么装逼，终成为新一代装逼大师，将装逼方法研究的出神入化，各种装逼方法，无死角装逼，终于横空出世…。你看，他又在装逼......."];
        
        [_arr addObject:@"孟婆对阎王说：我天天给人喝孟婆汤，太无聊了，我要投胎转世。阎王说：好，你把孟婆汤喝了，就去投胎吧。孟婆喝了汤之后，阎王说：从今以后你就叫孟婆，给过桥的人喝孟婆汤。\n 一家三口，儿子饿了，对妈妈说：妈，我饿了，你来做饭给我吃吧 他妈说：我缝被子缝住口了，出不去，叫你爸做给你吃。他爸一听就生气了：蠢货，要不是我砌墙围住出不去，我非连你带被子都扔出去不可。"];
        
        [_arr addObject:@"很多时候我们过高估计了机遇的力量，低估了规划的重要性，不明确的乐观主义者只知道未来越来越好，却不知道究竟多好，因此不去制定具体计划。他想在未来获利，但是却认为没有必要制定具体规划。"];
        
        [_arr addObject:@"“灰太狼为什么一直想抓羊？仅仅是为了吃羊肉吗？”\n“不对。灰太狼特别爱他老婆，他抓羊的根本目的，是为了提炼羊胎素！”"];
        
         _arrimg  =[[NSMutableArray alloc]initWithObjects:
                        @[@"Xunxian_1.jpeg"],
                        @[@"Xunxian_1.jpeg",@"Xunxian_2.jpeg"],
                        @[@"Xunxian_1.jpeg",@"Xunxian_2.jpeg",@"Xunxian_3.jpeg"],
                        @[@"Xunxian_1.jpeg",@"Xunxian_2.jpeg",@"Xunxian_3.jpeg",@"Xunxian_4.jpeg",@"Xunxian_5.jpeg"],
                        @[@"Xunxian_1.jpeg",@"Xunxian_2.jpeg",@"Xunxian_3.jpeg",@"Xunxian_4.jpeg",@"Xunxian_5.jpeg",@"Xunxian_6.jpeg"],
                        @[@"Xunxian_24.jpeg",@"Xunxian_23.jpeg",@"Xunxian_22.jpeg",@"Xunxian_20.jpeg",@"Xunxian_19.jpeg",@"Xunxian_18.jpeg"],
                        @[@"Xunxian_20.jpeg",@"Xunxian_19.jpeg",@"Xunxian_13.jpeg",@"Xunxian_14.jpeg",@"Xunxian_15.jpeg"],
                        @[@"Xunxian_11.jpeg",@"Xunxian_12.jpeg",@"Xunxian_16.jpeg",@"Xunxian_15.jpeg"],
                        @[@"Xunxian_11.jpeg",@"Xunxian_22.jpeg",@"Xunxian_13.jpeg"],
                        @[@"Xunxian_11.jpeg",@"Xunxian_13.jpeg"],
                        @[@"Xunxian_10.jpeg",@"Xunxian_22.jpeg",@"Xunxian_3.jpeg"],
                    @[@"Xunxian_13.jpeg",@"Xunxian_18.jpeg",@"Xunxian_19.jpeg",@"Xunxian_15.jpeg"],
                    
                    nil] ;
        
        for(int i=0;i<_arr.count;i++){
            RecordModel *m=[[RecordModel alloc]init];
            m.icon=[NSString stringWithFormat:@"Xunxian_%i.jpeg",i+1];
            m.record=_arr[i];
            
            NSLog(@"%@",_arrimg[i]);
            
            m.image = _arrimg[i];
            //把模型那存到模型数组中
            [self.arrModel addObject:m];
        }
    }

    return _arr;
}


-(NSMutableArray *)arrModel
{
    if(_arrModel==nil){
        _arrModel=[NSMutableArray array];
    }
    return _arrModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推拽返回测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KMW, KMH) style:UITableViewStyleGrouped];
    self.tableview.dataSource    = self;
    self.tableview.delegate      = self;
    self.tableview.showsVerticalScrollIndicator =NO;
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.separatorStyle=UITableViewCellSeparatorStyleNone;//去掉默认下划线
    self.tableview.estimatedRowHeight=200; //预估行高 可以提高性能
    self.tableview.rowHeight = 88;
    [self.view addSubview:self.tableview];
   
    //注册表格单元
    [self.tableview registerClass:[RecordViewCell class] forCellReuseIdentifier:recordIndentifier];
}


//段尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    RecordModel *model = _arrModel[section];
    
    int integer = (int)model.image.count / NumberRow;
    int remainder = model.image.count % NumberRow;
    if (remainder>0) {
        remainder = 1;
    }
    
    int imageHeight = (((KMW  - 12 - (3 * (NumberRow - 1))) / NumberRow) * (integer + remainder) + (integer + remainder) * 4);
    
    if (imageHeight > KMW - 64) {
        imageHeight = KMW - 64 - 2 * CollClearance;
    }
    
    return imageHeight;
}

//段尾视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KMW, 80 )];
    mainView.backgroundColor = [UIColor whiteColor];
    RecordModel *model = _arrModel[section];
    
    int integer = (int)model.image.count / NumberRow;
    int remainder = model.image.count % NumberRow;
    if (remainder>0) {
        remainder = 1;
    }
    
    int imageHeight = (((KMW  - 12 - (3 * (NumberRow - 1))) / NumberRow) * (integer + remainder) + (integer + remainder) * 4);
    
    if (imageHeight > KMW - 64) {
        imageHeight = KMW - 64 - 2 * CollClearance;
    }
    
    ManyImageView *imageView  = [ManyImageView initWithFrame:CGRectMake(0, 0, KMW, imageHeight) imageArr:model.image numberRow:NumberRow widthClearance:3];
    
    imageView.backgroundColor = [UIColor redColor];
    [mainView addSubview:imageView];
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor grayColor];
   
    lineLabel.frame = CGRectMake(0, imageView.bottom+10, KMW, 0.5);
    [mainView addSubview:lineLabel];
    
    return mainView;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arr.count;
}


/*
 返回多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //因为是我们自定义的数据 所以 这里写arr而不是arrModel  因为只有这样才会调用arr的懒加载犯法
    
//    NSLog(@"%ld",self.arr.count);
    return 1;
}

/*
 返回表格单元
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取出模型
    RecordModel *model=self.arrModel[indexPath.row];
//    NSLog(@"%@",model.icon);
//    NSLog(@"%@",model.record);

    RecordViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:recordIndentifier];
    //传递模型给cell
    cell.recordModel=model;
    
    return cell;
}

/*
 *  返回每一个表格单元的高度
 */

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //取出模型
    RecordModel *Model = self.arrModel[indexPath.row];
    
    return    Model.cellHeight ;
}

@end
