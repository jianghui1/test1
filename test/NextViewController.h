//
//  NextViewController.h
//  test
//
//  Created by ys on 15/11/13.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

// 测试协议是否能够继承
@protocol NextViewControllerDelegate <NSObject>

- (void)testViewControllerProtocolIsCanHabit;

@end

@interface NextViewController : UIViewController

@property(nonatomic, strong) id<NextViewControllerDelegate>delegate;

@end
