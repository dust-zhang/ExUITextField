//
//  ViewController.m
//  ExUITextField
//
//  Created by zhangjingfei on 16/7/2019.
//  Copyright © 2019 zhangjingfei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    textFieldTel = [[ExUITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-60,45) type:0];
    [textFieldTel.myTextField setPlaceholder:NSLocalizedString(@"请输入手机号", @"请输入手机号")];
    [textFieldTel.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textFieldTel.myTextField setTextColor:[UIColor blackColor]];
    textFieldTel.myTextField.delegate =self;
    [textFieldTel.myTextField setSecureTextEntry:YES ];
    textFieldTel.delegate = self;
    [self.view addSubview:textFieldTel];
    [textFieldTel.myTextField addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textFieldTel.myTextField addTarget:self action:@selector(textFiledValueChange:) forControlEvents:UIControlEventEditingChanged];
    
    textFieldPwd = [[ExUITextField alloc] initWithFrame:CGRectMake(10, 300, self.view.frame.size.width-60,45) type:1];
    [textFieldPwd.myTextField setPlaceholder:NSLocalizedString(@"请输入密码", @"请输入密码")];
    [textFieldPwd.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textFieldPwd.myTextField setTextColor:[UIColor blackColor]];
    textFieldPwd.myTextField.delegate =self;
    [textFieldPwd.myTextField setSecureTextEntry:YES ];
    textFieldPwd.delegate = self;
    [self.view addSubview:textFieldPwd.myTextField];
    [textFieldPwd.myTextField addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textFieldPwd.myTextField addTarget:self action:@selector(textFiledValueChange:) forControlEvents:UIControlEventEditingChanged];
    
    
}
#pragma mark changedTextField
-(void)textFiledDidBegin:(UITextField*)textField
{
    if (textField == textFieldTel.myTextField && textFieldTel.myTextField.text.length>0)
    {
        textFieldTel.btnDelete.hidden = NO;
    }
    else
    {
        textFieldTel.btnDelete.hidden = YES;
    }
}

-(void)textFiledValueChange:(UITextField*)textField
{
    if (textField == textFieldTel.myTextField && textFieldTel.myTextField.text.length>0)
    {
        textFieldTel.btnDelete.hidden = NO;
    }
    else
    {
        textFieldTel.btnDelete.hidden = YES;
    }
}

#pragma mark 清空手机号
-(void)onButtonClearText
{
    textFieldTel.myTextField.text = @"";
    textFieldTel.btnDelete.hidden = YES;
}

#pragma mark 显示隐藏密码
-(void)onButtonShowHidePwd:(BOOL)showHide
{
    [textFieldPwd.myTextField setSecureTextEntry:showHide ];
}


@end
