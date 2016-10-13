//
//  AppDelegate.m
//  test
//
//  Created by ys on 15/11/9.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "UIImageView+WebCache.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSRunLoop *runLoop;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor greenColor];
    [self.window makeKeyAndVisible];
    
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
//    self.window.rootViewController = [ViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"]];
    
    // 动态加载lunchImage
    UIView *lunchView = [[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:nil options:nil].firstObject;
    lunchView.frame = self.window.frame;
    [self.window addSubview:lunchView];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 300)];
    [imageView setImageWithURL:[NSURL URLWithString:@"http://www.jerehedu.com/images/temp/logo.gif"]];
    [lunchView addSubview:imageView];
    lunchView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    [self.window bringSubviewToFront:lunchView];
    lunchView.tag = 111;
    [self performSelectorInBackground:@selector(disappear) withObject:self];                     
    
    NSLog(@"%@", NSHomeDirectory());
    
    return YES;
}
- (void)disappear
{
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:NO];
    self.runLoop = [NSRunLoop currentRunLoop];
    [self.runLoop run];
}
- (void)timerAction:(NSTimer *)timer
{
    [[self.window viewWithTag:111] removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
