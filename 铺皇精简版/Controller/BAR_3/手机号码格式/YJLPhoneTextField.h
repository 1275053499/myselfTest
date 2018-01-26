//
//  YJLPhoneTextField.h
//  铺皇精简版
//
//  Created by selice on 2017/12/16.
//  Copyright © 2017年 中国铺皇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJLPhoneTextField : UITextField<UITextFieldDelegate>
{
    NSString    *_previousTextFieldContent;
    UITextRange *_previousSelection;
}
@end
