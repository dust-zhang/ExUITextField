//
//  ExUITextField.h
//  movikr
//
//  Created by Mapollo28 on 15/11/23.
//  Copyright © 2015年 movikr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExUITextFieldDelegate <NSObject>
-(void)onButtonClearText;
-(void)onButtonShowHidePwd:(BOOL)showHide btn:(UIButton *)btn;
@end

@interface ExUITextField : UIView
{
    BOOL showHide;
}
@property (strong,nonatomic)    UIButton            *btnDelete;
@property (strong,nonatomic)    UIButton            *btnShowHidePwd;
@property (strong,nonatomic)    UITextField         *myTextField;
@property (nonatomic,weak)      id<ExUITextFieldDelegate> delegate;

- (id)initWithFrame:(CGRect)frame type:(int)inputType showPwd:(BOOL)showHidePwd;

@end
