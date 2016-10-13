//
//  UIImageView+WebCache.m
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "UIImageView+WebCache.h"

@interface UIImageView ()<NSURLConnectionDelegate, NSURLConnectionDataDelegate>

// 类目不能够添加属性
//@property (nonatomic, strong) NSMutableData *data;

@end

@implementation UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
//    dispatch_queue_t queue = dispatch_queue_create("loadImage", NULL);
//    dispatch_async(queue, ^{
//        NSData *data = [NSData dataWithContentsOfURL:url];
//        UIImage *image = [UIImage imageWithData:data];
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            self.image = image;
//        });
//    });
    
    // 使用同步请求
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:url];
//    [request setHTTPMethod:@"GET"];
//    [request setTimeoutInterval:60];
//    
//    NSURLResponse *response;
//    // 发送同步请求
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    UIImage *image = [UIImage imageWithData:data];
//    self.image = image;

    // 异步请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    // 发送异步请求
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        UIImage *image = [UIImage imageWithData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.image = image;
//        });
//    }];

//    self.data = [NSMutableData data];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"数据加载失败");
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"有反应%@", response);
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"有数据%@", data);
//    [self.data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"完成加载%@", connection);
}

@end
