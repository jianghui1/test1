//
//  BaseH5ViewController.m
//  
//
//  Created by ys on 15/11/30.
//
//

#import "BaseH5ViewController.h"

@interface BaseH5ViewController ()

@end

@implementation BaseH5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 * UIWebViewDelegate
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"我是父类中的");
    return YES;
}

@end
