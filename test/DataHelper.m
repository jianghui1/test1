//
//  DataHelper.m
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "DataHelper.h"

#import "RequestHelper.h"

#define BASE_URL @"http://www.weather.com.cn/data/sk"

@implementation DataHelper

+ (void)getWeatherData:(NSDictionary *)params block:(Completion)block
{
    NSString *cityCode = [params objectForKey:@"code"];
    NSString *urlString = [BASE_URL stringByAppendingFormat:@"/%@.html", cityCode];
    NSLog(@"%@", urlString);
    
    [self startRequest:params url:urlString isGet:NO block:block];
}

+ (void)startRequest:(NSDictionary *)params url:(NSString *)urlString isGet:(BOOL)get block:(Completion)block
{
    RequestHelper *requestHelper = [RequestHelper requestWithURL:[NSURL URLWithString:BASE_URL]];
    if (get) {
        [requestHelper setHTTPMethod:@"GET"];
    } else {
        [requestHelper setHTTPMethod:@"POST"];
    }
    [requestHelper setTimeoutInterval:60];
    
    requestHelper.block = ^(NSData *data) {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", dataString);
        id ret = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        block(ret);
    };
    [requestHelper startAsynrc];
}

@end
