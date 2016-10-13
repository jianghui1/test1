//
//  RequestHelper.h
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FinishLoadBlock) (NSData *);

@interface RequestHelper : NSMutableURLRequest<NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, copy) FinishLoadBlock block;

// 开始异步请求
- (void)startAsynrc;
- (void)cancel;

@end
