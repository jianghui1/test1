//
//  TestButtonViewController.m
//  test
//
//  Created by ys on 15/11/18.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "TestButtonViewController.h"

#import "TestMainThreadViewController.h"
#import "TestButton.h"

@interface TestButtonViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet TestButton *testButton;

@property (weak, nonatomic) IBOutlet UITextField *testTextField;


@end

@implementation TestButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextAction) name:UITextFieldTextDidChangeNotification object:self.testTextField];
    
    // 改变placeholderLabel的字体大小与颜色
    [self.testTextField setValue:[UIColor redColor] forKeyPath:@"placeholderLabel.textColor"];
    [self.testTextField setValue:[UIFont boldSystemFontOfSize:10] forKeyPath:@"_placeholderLabel.font"];

    // 设置阴影效果
    self.testTextField.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.testTextField.layer.bounds].CGPath;
    self.testTextField.layer.shadowColor = [UIColor blackColor].CGColor;
    self.testTextField.layer.shadowOpacity = 1.6f;
    self.testTextField.layer.shadowOffset = CGSizeMake(0, 1);
    self.testTextField.layer.shadowRadius = 1.0;
    
    self.testButton.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.testButton.layer.bounds].CGPath;
    self.testButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.testButton.layer.shadowOpacity = 3.0f;
    self.testButton.layer.shadowRadius = 3;
//    self.testButton.layer.shadowRadius = 10;
    self.testButton.layer.shadowOffset = CGSizeMake(3, 3);
    [self.testButton addTarget:self action:@selector(testButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    // 测试给button添加图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(300, 600, 50, 50);
    [button setBackgroundImage:[UIImage imageNamed:@"CloseButton"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"CloseButton"] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    
    // 测试贝塞尔曲线的用法
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:button.bounds cornerRadius:5.0f];
    [[UIColor colorWithWhite:.8 alpha:.5] setFill];
    [roundedRect fillWithBlendMode:kCGBlendModeNormal alpha:1];
}

- (void)nextAction
{
    if (self.testTextField.text.length == 2) {
        NSLog(@"^^^^^^^^^^^^");
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self.testTextField];
    }
}

- (IBAction)nextAction:(TestButton *)sender {
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if (range.location == 11) {
//        NSLog(@"haha");
//        return YES;
//    }
//    if (range.location == 12) {
//        return NO;
//    }
//    return YES;
//}

/**
 testButtonAction
 */
- (void)testButtonAction
{
    [self.navigationController pushViewController:[TestMainThreadViewController new] animated:YES];
}

@end
