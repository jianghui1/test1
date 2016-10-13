//
//  RequestHelper.m
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "RequestHelper.h"

@implementation RequestHelper

- (void)startAsynrc
{
    self.data = [NSMutableData data];
    
    // 发送异步请求
    self.connection = [NSURLConnection connectionWithRequest:self delegate:self];
}

- (void)cancel
{
    [self.connection cancel];
}

#pragma mark - NSURLConnection delegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.block(_data);
}
@end
