//
//  NavView.m
//  test
//
//  Created by ys on 15/11/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "NavView.h"

@implementation NavView

+ (NavView *)instanceView
{
    NSArray *nibViewArray = [[NSBundle mainBundle] loadNibNamed:@"NavView" owner:nil options:nil];
    return [nibViewArray firstObject];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (IBAction)nextButtonAction:(UIButton *)sender
{
    self.nextButtonBlock();
}

@end
