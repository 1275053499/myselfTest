//
//  YJLILLview.m
//  铺皇精简版
//
//  Created by selice on 2017/12/8.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import "YJLILLview.h"
@implementation YJLILLview

+(UIView *)initWithFrame:(CGRect)frame Leftimage:(UIImage *)leftimage Maintitle:(NSString *)maintitle Subtitle:(NSString *)subtitle imageW:(CGFloat)imageW imageH:(CGFloat)imageH{
    
    UIView *mainview =[[UIView alloc]initWithFrame:frame];
    mainview.backgroundColor   = [UIColor whiteColor];
   
    UIImageView * imageview    = [[UIImageView alloc]initWithFrame:CGRectMake(5, (frame.size.height-imageW)/2,imageW, imageH)];
    imageview.image            = leftimage;
    [mainview addSubview:imageview];

    UILabel *mainlab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageview.frame)+5, (frame.size.height-imageW)/2, frame.size.width-imageW-10, imageH/2)];
    mainlab.text             = maintitle;
    mainlab.textColor        = [UIColor blackColor];
    mainlab.font             = [UIFont systemFontOfSize:12.0f];
    mainlab.textAlignment    = NSTextAlignmentLeft;
    [mainview addSubview:mainlab];
    
    UILabel *sublab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageview.frame)+5, CGRectGetMaxY(mainlab.frame), frame.size.width-imageW-10, imageH/2)];
    sublab.text          = subtitle;
    sublab.textColor     = [UIColor redColor];
    sublab.font          = [UIFont systemFontOfSize:12.0f];
    sublab.textAlignment = NSTextAlignmentLeft;
    [mainview addSubview:sublab];
    
    return mainview;
    
}




@end
