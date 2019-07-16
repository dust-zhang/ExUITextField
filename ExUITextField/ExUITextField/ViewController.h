//
//  ViewController.h
//  ExUITextField
//
//  Created by zhangjingfei on 16/7/2019.
//  Copyright © 2019 zhangjingfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExUITextField.h"

@interface ViewController : UIViewController<UITextFieldDelegate, ExUITextFieldDelegate>
{
    ExUITextField         *textFieldTel;
    ExUITextField         *textFieldPwd;
}


@end

