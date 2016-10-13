//
//  DataHelper.h
//  test
//
//  Created by ys on 15/11/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Completion) (id);

@interface DataHelper : NSObject

// 访问天气预报接口数据
+ (void)getWeatherData:(NSDictionary *)params block:(Completion)block;

@end
