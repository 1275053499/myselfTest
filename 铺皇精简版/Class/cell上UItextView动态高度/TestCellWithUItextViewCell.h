//
//  TestCellWithUItextViewCell.h
//  铺皇精简版
//
//  Created by selice on 2017/12/23.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TestCellWithUItextViewCellDelegate <UITableViewDelegate>

@required

-(void)updatedText:(NSString *)text  atIndexPath:(NSIndexPath *)indexPath;

@end

@interface TestCellWithUItextViewCell : UITableViewCell<UITextViewDelegate>
@property (nonatomic,assign) CGFloat CellHeight;
@property (weak,nonatomic)UITableView * tableView;

@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,strong)NSString *contentStr;
@property (nonatomic,strong)NSString *placeholder;

@property (nonatomic,assign)id<TestCellWithUItextViewCellDelegate> delegate;

@end
