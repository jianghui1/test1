//
//  TestViewController.m
//  
//
//  Created by ys on 15/11/30.
//
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://app.liqu.com/H5/Search"]]];
}

//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
////    NSLog(@"我是子类的webView");
//    [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
//    return YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
