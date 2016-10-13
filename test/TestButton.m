//
//  TestButton.m
//  test
//
//  Created by ys on 15/11/18.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "TestButton.h"

@implementation TestButton

//- (instancetype)init
//{
//    if (self = [super init]) {
//        [self setTitle:@"Test" forState:UIControlStateNormal];
//    }
//    return self;
//}
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setTitle:@"Test" forState:UIControlStateNormal];
//    }
//    return self;
//}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setTitle:@"Test" forState:UIControlStateNormal];
    }
    return self;
}

@end
