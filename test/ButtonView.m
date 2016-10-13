//
//  ButtonView.m
//  test
//
//  Created by ys on 15/11/18.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ButtonView.h"

#import "TestButton.h"

@interface ButtonView ()



@end

@implementation ButtonView

+ (ButtonView *)buttonView
{
    NSArray *nibViewArray = [[NSBundle mainBundle] loadNibNamed:@"ButtonView" owner:nil options:nil];
    return nibViewArray.firstObject;
}

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.backgroundColor = [UIColor redColor];
//    }
//    return self;
//}



@end
