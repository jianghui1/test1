//
//  TestMainThreadViewController.m
//  test
//
//  Created by ys on 15/12/17.
//  Copyright © 2015年 ys. All rights reserved.
//

#import "TestMainThreadViewController.h"

#import "GMDCircleLoader.h"
#import "UIView+MJExtension.h"
#import "MBProgressHUD.h"

@interface TestMainThreadViewController ()

@end

@implementation TestMainThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    
    // 添加加载框
//    GMDCircleLoader *gmdCl = [GMDCircleLoader setOnView:self.tableView withTitle:nil animated:YES];
//    gmdCl.mj_y = 300;

    MBProgressHUD *mbHud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    mbHud.mj_y = 300;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text = [@(indexPath.row) stringValue];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row / 10;
}

@end
