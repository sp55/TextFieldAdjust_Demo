//
//  ViewController.m
//  TextFieldAdjust_Demo
//
//  Created by admin on 16/9/26.
//  Copyright © 2016年 AlezJi. All rights reserved.
//http://ios.jobbole.com/89297/
//UITextField 的那点事

#import "ViewController.h"
#import "EmojiTextRestrict.h"
#import "UITextField+Adjust.h"
#import "UITextField+TextRestrict.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField * textField;
@end

@implementation ViewController
{
    UITextField * one;
    UITextField * two;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.textField = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, 200, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: self.textField];
    self.textField.delegate = self;
    self.textField.restrictType = RestrictTypeOnlyNumber;
//    self.textField.textRestrict = [[EmojiTextRestrict alloc] init];
    
    one = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, 200, 40)];
    one.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: one];
    one.delegate = self;
    [one setAutoAdjust: YES];
    
    two = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, 200, 40)];
    two.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: two];
    two.delegate = self;
    [two setAutoAdjust: YES];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.textField.center = self.view.center;
    one.center = CGPointMake(_textField.center.x, _textField.center.y + 100);
    two.center = CGPointMake(_textField.center.x, one.center.y + 100);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Notification
- (void)keyboardWillShow: (NSNotification *)notification
{
    NSLog(@"keyboard will show");
}

- (void)keyboardWillHide: (NSNotification *)notification
{
    NSLog(@"keyboard will hide");
}


@end
