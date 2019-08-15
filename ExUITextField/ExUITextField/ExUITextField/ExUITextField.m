//
//  ExUITextField.m
//  movikr
//
//  Created by Mapollo28 on 15/11/23.
//  Copyright © 2015年 movikr. All rights reserved.
//

#import "ExUITextField.h"


@implementation ExUITextField

//inputType :输入的是密码还是其他类型
//0：其他类型，显示清空按钮
//1：密码，显示隐藏显示密码按钮
- (id)initWithFrame:(CGRect)frame type:(int)inputType showPwd:(BOOL)showHidePwd
{
    self = [super initWithFrame:frame];
    if (self)
    {
        showHide = !showHidePwd;
        // Initialization code
        UIView *viewbg = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        viewbg.userInteractionEnabled = YES;
        [self addSubview:viewbg];
        
        self.myTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width-frame.size.height, frame.size.height)];
        [viewbg addSubview:self.myTextField];

        if(showHidePwd)
        {
            if (inputType == 0 )
            {
                self.btnDelete = [[UIButton alloc ] initWithFrame:CGRectMake(frame.size.width-15, 0, 15, frame.size.height)];
                [self.btnDelete setImage:[UIImage imageNamed:@"LoginMobileDelete"] forState:UIControlStateNormal];
                [self.btnDelete addTarget:self action:@selector(onButtonDelete:) forControlEvents:UIControlEventTouchUpInside];
                [viewbg addSubview:self.btnDelete];
            }
            else
            {
                self.btnShowHidePwd = [[UIButton alloc ] initWithFrame:CGRectMake(frame.size.width-17, 0, 17, frame.size.height)];
                [self.btnShowHidePwd setImage:[UIImage imageNamed:@"LoginCloseEyes"] forState:UIControlStateNormal];
                [self.btnShowHidePwd addTarget:self action:@selector(onButtonShowHidePwd:) forControlEvents:UIControlEventTouchUpInside];
                [viewbg addSubview:self.btnShowHidePwd];
            }
        }
        else
        {
            if (inputType == 0 )
            {
                self.btnDelete = [[UIButton alloc ] initWithFrame:CGRectMake(frame.size.width-15, 0, 15, frame.size.height)];
                [self.btnDelete setImage:[UIImage imageNamed:@"LoginMobileDelete"] forState:UIControlStateNormal];
                [self.btnDelete addTarget:self action:@selector(onButtonDelete:) forControlEvents:UIControlEventTouchUpInside];
                [viewbg addSubview:self.btnDelete];
            }
            else
            {
                self.btnShowHidePwd = [[UIButton alloc ] initWithFrame:CGRectMake(frame.size.width-17, 0, 17, frame.size.height)];
                [self.btnShowHidePwd setImage:[UIImage imageNamed:@"LoginOpenEyes"] forState:UIControlStateNormal];
                [self.btnShowHidePwd addTarget:self action:@selector(onButtonShowHidePwd:) forControlEvents:UIControlEventTouchUpInside];
                [viewbg addSubview:self.btnShowHidePwd];
            }
        }
        
    }
    return self;
}

-(void)onButtonDelete:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(onButtonClearText)])
    {
        [self.delegate onButtonClearText];
    }
}
-(void)onButtonShowHidePwd:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(onButtonShowHidePwd:btn:)])
    {
        [self.delegate onButtonShowHidePwd:showHide btn:sender];
        showHide = !showHide;
        [self.btnShowHidePwd setImage:[UIImage imageNamed:showHide?@"LoginCloseEyes":@"LoginOpenEyes"] forState:UIControlStateNormal];
    }
}

@end
