//
//  TestChildViewController.m
//  test
//
//  Created by ys on 15/11/17.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "TestChildViewController.h"

#import "NextViewController.h"
#import "TestButton.h"
#import "ButtonView.h"

@implementation TestChildViewController

//- (void)addSubViews
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"children" forState:UIControlStateNormal];
//    button.frame = CGRectMake(100, 200, 100, 30);
//    [self.view addSubview:button];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 测试xib中的添加自己定义的类
//    TestButton *button = [[TestButton alloc] initWithFrame:CGRectMake(300, 600, 50, 30)];
//    button.backgroundColor = [UIColor redColor];
//    [self.view addSubview:button];

    ButtonView *buttonView = [ButtonView buttonView];
    buttonView.backgroundColor = [UIColor redColor];
    [self.view addSubview:buttonView];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NextViewController *nextVC = [[NextViewController alloc] init];
    nextVC.delegate = self;
    [self.navigationController pushViewController:nextVC animated:YES];
}

/**
 测试子类中viewwillappear在父类中的调用情况
 */
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}

@end
