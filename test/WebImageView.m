//
//  WebImageView.m
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "WebImageView.h"

//#import "ASIFormDataRequest.h"
//#import "ASIDownloadCache.h"

@implementation WebImageView

- (void)setImageURL:(NSURL *)url
{
//    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
//    // 设置缓存
//    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
//    ASIDownloadCache *cache = [[ASIDownloadCache alloc] init];
//    [cache setStoragePath:cachePath];
//    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
//    
//    // 每次请求会将上一次的请求缓存清除掉
////    request.cacheStoragePolicy = ASICacheForSessionDurationCacheStoragePolicy;
//    // 持久缓存，
//    request.cacheStoragePolicy = ASICachePermanentlyCacheStoragePolicy;
//    request.downloadCache = cache;
//    
//    // 发送异步请求
//    [request startAsynchronous];
}

@end
