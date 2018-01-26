//
//  TestCellWithUItextViewCell.m
//  铺皇精简版
//
//  Created by selice on 2017/12/23.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "TestCellWithUItextViewCell.h"

@implementation TestCellWithUItextViewCell{
    UILabel     *   titleLabel;
    UITextView  *   _textView;
    UILabel     *   placeholderLabel;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(15, 0, 80, 44)];
    titleLabel.text=@"内容:";
    titleLabel.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:titleLabel];
    
    _textView=[[UITextView alloc]initWithFrame:CGRectMake(95, 5, KMW-95-15, 44)];
    _textView.delegate=self;
    _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _textView.font=[UIFont systemFontOfSize:15];
    _textView.scrollEnabled=NO;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.showsHorizontalScrollIndicator = NO;
    _textView.returnKeyType=UIReturnKeyDone;
    _textView.keyboardType=UIKeyboardTypeDefault;
    _textView.backgroundColor=[UIColor clearColor];
    
    UIView *dismissView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KMW, 40)];
    dismissView.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(KMW-50, 0, 40, 40)];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [dismissView addSubview:button];
    _textView.inputAccessoryView = dismissView;
    [self.contentView addSubview:_textView];
    
    placeholderLabel=[[UILabel alloc] initWithFrame:CGRectMake(2, -5, 80, 44)];
    placeholderLabel.text=@"请输入内容";
    placeholderLabel.textColor=[UIColor lightGrayColor];
    placeholderLabel.font=[UIFont systemFontOfSize:15];
    [_textView addSubview:placeholderLabel];
    
}

- (void)dismissButtonAction {
    [_textView resignFirstResponder];
}

- (void)setContentStr:(NSString *)contentStr {
    _contentStr=contentStr;
    _textView.text=_contentStr;
}
- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath=indexPath;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder=placeholder;
    placeholderLabel.text=_placeholder;
}

- (CGFloat)CellHeight {
    CGSize size = [_textView sizeThatFits:CGSizeMake(_textView.frame.size.width, MAXFLOAT)];
    return size.height+5;
}




-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length==0) {
        placeholderLabel.hidden=NO;
    } else {
        placeholderLabel.hidden=YES;
    }
    if ([self.delegate respondsToSelector:@selector(updatedText:atIndexPath:)]) {
        [self.delegate updatedText:textView.text atIndexPath:_indexPath];
    }
    
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    textView.frame =  CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height+18);
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}














- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
