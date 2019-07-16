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
- (id)initWithFrame:(CGRect)frame type:(int)inputType
{
    self = [super initWithFrame:frame];
    if (self)
    {
        showHide = NO;
        // Initialization code
        self.myTextField = [[UITextField alloc]initWithFrame:frame];
        [self.myTextField setBackgroundColor:[UIColor whiteColor]];
        self.userInteractionEnabled = YES;
        [self addSubview:self.myTextField];
        //因为图片大小不一致，所以分开写
        if (inputType == 0 )
        {
            self.btnDelete = [[UWScaleButton alloc ] initWithFrame:CGRectMake(frame.size.width-15, (frame.size.height/2)-7.5, 15, 15)];
            [self.btnDelete setImage:[UIImage imageNamed:@"LoginMobileDelete"] forState:UIControlStateNormal];
            [self.btnDelete addTarget:self action:@selector(onButtonDelete:) forControlEvents:UIControlEventTouchUpInside];
            [self.myTextField addSubview:self.btnDelete];
        }
       else
       {
           self.btnShowHidePwd = [[UWScaleButton alloc ] initWithFrame:CGRectMake(frame.size.width-17, (frame.size.height/2)-6, 17, 12)];
           [self.btnShowHidePwd setImage:[UIImage imageNamed:@"LoginCloseEyes"] forState:UIControlStateNormal];
           [self.btnShowHidePwd addTarget:self action:@selector(onButtonShowHidePwd:) forControlEvents:UIControlEventTouchUpInside];
           [self.myTextField addSubview:self.btnShowHidePwd];
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
    if (sender.isSelected)
    {
        showHide = YES;
    }
    if ([self.delegate respondsToSelector:@selector(onButtonShowHidePwd:)])
    {
        [self.delegate onButtonShowHidePwd:showHide];
        showHide = !showHide;
    }
}

@end
