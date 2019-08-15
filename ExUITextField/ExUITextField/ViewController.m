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
    
    textFieldTel = [[ExUITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-60,45) type:0 showPwd:YES];
    [textFieldTel.myTextField setPlaceholder:NSLocalizedString(@"请输入手机号", @"请输入手机号")];
    [textFieldTel.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textFieldTel.myTextField setTextColor:[UIColor blackColor]];
    textFieldTel.myTextField.delegate =self;
    [textFieldTel.myTextField setSecureTextEntry:YES ];
    [textFieldTel.myTextField addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textFieldTel.myTextField addTarget:self action:@selector(textFiledValueChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textFieldTel];
    textFieldTel.delegate = self;
    
    textFieldPwd = [[ExUITextField alloc] initWithFrame:CGRectMake(10, 200, self.view.frame.size.width-60,45) type:1 showPwd:YES];
    [textFieldPwd.myTextField setPlaceholder:@"请输入密码"];
    [textFieldPwd.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textFieldPwd.myTextField setTextColor:[UIColor whiteColor]];
    textFieldPwd.myTextField.delegate =self;
    [textFieldPwd.myTextField setSecureTextEntry:YES ];
    textFieldPwd.delegate = self;
    [textFieldPwd.myTextField addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textFieldPwd.myTextField addTarget:self action:@selector(textFiledValueChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textFieldPwd];
    textFieldPwd.btnShowHidePwd.tag = 0;
    
    textFieldPwd1 = [[ExUITextField alloc] initWithFrame:CGRectMake(10, 260, self.view.frame.size.width-60,45) type:1 showPwd:YES];
    [textFieldPwd1.myTextField setPlaceholder:@"请输入密码"];
    [textFieldPwd1.myTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textFieldPwd1.myTextField setTextColor:[UIColor whiteColor]];
    textFieldPwd1.myTextField.delegate =self;
    [textFieldPwd1.myTextField setSecureTextEntry:YES ];
    textFieldPwd1.delegate = self;
    [textFieldPwd1.myTextField addTarget:self action:@selector(textFiledDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [textFieldPwd1.myTextField addTarget:self action:@selector(textFiledValueChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:textFieldPwd1];
    textFieldPwd1.btnShowHidePwd.tag = 1;
    
   
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
-(void)onButtonShowHidePwd:(BOOL)showHide btn:(UIButton *)btn
{
    if(btn.tag == 0 )
    {
        [textFieldPwd.myTextField setSecureTextEntry:showHide];
    }
    else
    {
        [textFieldPwd1.myTextField setSecureTextEntry:showHide];
    }
}


@end
