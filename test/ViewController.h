//
//  ViewController.h
//  test
//
//  Created by ys on 15/11/9.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NextViewController.h"

@interface ViewController : UIViewController<NextViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

/**
 提供一个方法，供子类增加自身的视图
 */
- (void)addSubViews;

@end

