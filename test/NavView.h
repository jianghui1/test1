//
//  NavView.h
//  test
//
//  Created by ys on 15/11/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavView : UIView

@property (nonatomic , copy) void (^nextButtonBlock) (void);

+ (NavView *)instanceView;

@end
