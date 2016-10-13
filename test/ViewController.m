//
//  ViewController.m
//  test
//
//  Created by ys on 15/11/9.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+WebCache.h"
#import "GMDCircleLoader.h"
#import "UIScrollView+VORefresh.h"
#import "XHButton.h"
#import "QRCodeReaderViewController.h"
#import "MJRefresh.h"
#import "NavView.h"
#import "CommonConst.h"

#import "NextViewController.h"

#import "DataHelper.h"

#import "TestModel.h"

#import "TestChildViewController.h"

#import "AdView.h"

#import "MZGuidePages.h"

#import "TestButtonViewController.h"

#import "TestViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *bigScrollView;
@property (nonatomic, strong) NSRunLoop *runLoop;

@property (nonatomic, copy) NSString *testObserver;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
    
    // 设置状态栏
//    [self setupStatus];

//    // 隐藏导航栏
//    self.navigationController.navigationBarHidden = YES;
    
    // 添加轮播图
    [self addScrollView];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 给轮播图添加定时器
//    [self performSelectorInBackground:@selector(addTimer:) withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(addTimer:) toTarget:self withObject:@"halou"];
//    [self addTimer];
    
    // 测试SDWebImage下载图片
//    [self addSDWebImageDownLoad];
    
    // 测试第三方页面菊花
//    [self testGMDCircleLoader];
    
    // 测试第三方可移动button
//    [self testXHButton];
    
    // 添加tableView
//    [self addTableView];
    
    // 测试UIImageView加载gif图片
//    [self testImageViewGif];
    
    // GCD测试
//    [self testGCD];
    
    // 观察者的测试
//    [self testObserverBetweenTwoVC];
    
    // 多线程测试
//    [self testMultipleThread];
    
    // 测试封装的数据请求类
//    [self testNetWorkerHelper];
    
    // 测试kvc赋值
//    [self testKVC];
    
    // 测试字符数组
//    [self testCharArray];
    
    // 测试继承
//    [self testInherit];
    
    // 测试第三方轮播图
//    [self testRotatePicture];
    
    // 测试第三方引导图的淡出效果
//    [self testMZGuidePages];
}

/**
 测试子类中viewwillappear在父类中的调用情况
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@", self.class);
}

/**
 设置状态栏
 */
- (void)setupStatus
{
    // 字体状态栏颜色模式
//    kStatusBarStyleLightContent;
    // 设置状态栏是否隐藏
//    [UIApplication sharedApplication].statusBarHidden = YES;
}

/**
 添加自定义导航栏
 */
- (void)addNavView
{
    NavView *navView = [NavView instanceView];
    navView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    [self.view addSubview:navView];
    
    // 调用block实现点击事件
    navView.nextButtonBlock = ^ {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"恩恩" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [alertView show];
        [self.navigationController pushViewController:[NextViewController new] animated:YES];
    };
}

/**
 添加轮播图
 */
- (void)addScrollView
{
    self.bigScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.bigScrollView.alwaysBounceVertical = YES;
    [self.view addSubview:self.bigScrollView];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 150)];
    //    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor greenColor];
    self.scrollView.bounces = NO;
    self.scrollView.alwaysBounceVertical = YES;
    [self.bigScrollView addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 创建子视图
    [self addSubView];
    
//    [self.scrollView addTopRefreshWithTarget:self action:@selector(topRefresh)];
//    [self.scrollView addBottomRefreshWithTarget:self action:@selector(bottomRefresh)];
}
/**
 创建子视图
 */
- (void)addSubView
{
    for (int i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg" , i + 1]];
        imageView.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
}
/**
 timer
 */
- (void)addTimer:(NSString *)name
{
    NSLog(@"%@", name);
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    self.runLoop = [NSRunLoop currentRunLoop];
    [self.runLoop run];
}
- (void)timerAction:(NSTimer *)timer
{
    __block CGPoint point = self.scrollView.contentOffset;
    if (self.scrollView.contentOffset.x == self.scrollView.frame.size.width * 2) {
        [UIView animateWithDuration:1 animations:^{
            point.x = 0;
            self.scrollView.contentOffset = point;
        }];
    } else {
        [UIView animateWithDuration:1 animations:^{
            point.x += self.scrollView.frame.size.width;
            self.scrollView.contentOffset = point;
        }];
    }
    static int i = 0;
    NSLog(@"%d", i++);
}

/**
 测试SDWebImage下载图片
 */
- (void)addSDWebImageDownLoad
{
    //覆盖方法，指哪打哪，这个方法是下载imagePath2的时候响应
    //    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    //
    //    [manager downloadImageWithURL:[NSURL URLWithString:@"http://cdn1.liqu.cc/upload/chonggou/ad/8c862252-a218-4c38-8ad5-6769a6b6af29.png@600w_600h_90Q.png"] options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    //
    ////        NSLog(@"显示当前进度");
    //
    //    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    //
    ////        NSLog(@"下载完成");
    //
    ////        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    ////        imageView.image = image;
    ////        [self.view addSubview:imageView];
    //
    ////        NSLog(@"%ld", cacheType);
    //    }];
}

/**
 测试button隐藏下是没有点击事件的
 */
- (void)testButtonHiddenAction
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10, 100, 100, 30);
    [button setTitle:@"dianjia" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.hidden = YES;
}
- (void)buttonAction
{
    NSLog(@"hsioghosdj");
}

/**
 测试第三方页面菊花
 */
- (void)testGMDCircleLoader
{
    [GMDCircleLoader setOnView:self.view withTitle:nil animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [GMDCircleLoader hideFromView:self.view animated:YES];
    });
}

/**
 测试第三方可移动button
 */
- (void)testXHButton
{
    XHButton *button = [[XHButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentScan:) name:@"LQ_HONGBAOVC" object:nil];
}
/**
 第三方扫描
 
 @param sender 通知
 */
- (void)presentScan:(NSNotification *)sender
{
    //    QRCodeReaderViewController *reader = [[QRCodeReaderViewController alloc] init];
    //    reader.modalPresentationStyle = UIModalPresentationPopover;
    //
    //    [self presentViewController:reader animated:YES completion:nil];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id914878901"]]];
}

/**
 添加tableView
 */
- (void)addTableView
{
    //    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scrollView.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetHeight(self.scrollView.frame)) style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor redColor];
    
    // 使用利趣的上拉，下拉
    [self addLiquRefreshOrMjRefresh:@"MjRefresh"];
    
    // 给tableView添加遮挡视图
    //    [self addCoverViewToTableView];
    // 添加自定义导航栏
    [self addNavView];
    
//    [self addSubViews];
}
- (void)addLiquRefreshOrMjRefresh:(NSString *)string
{
    if ([string isEqualToString:@"LiquRefresh"]) {
        [self.tableView addTopRefreshWithTarget:self action:@selector(topRefresh)];
        [self.tableView addBottomRefreshWithTarget:self action:@selector(bottomRefresh)];
    } else {
        [self.tableView addHeaderWithTarget:self action:@selector(topRefresh)];
        [self.tableView addFooterWithTarget:self action:@selector(bottomRefresh)];
    }
}
- (void)topRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.topRefresh endRefreshing];
        [self.tableView headerEndRefreshing];
    });
}
- (void)bottomRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(20 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.scrollView.bottomRefresh endRefreshing];
        [self.tableView footerEndRefreshing];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}
/**
 给tableView添加遮挡视图
 */
- (void)addCoverViewToTableView
{
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        view.backgroundColor = [UIColor redColor];
        view;
    });
}

/**
 scrollView 的代理事件
 */
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
//}

/**
 测试UIImageView加载gif图片
 */
- (void)testImageViewGif
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    imageView.animationImages = @[[UIImage imageNamed:@"1.gif"]];
//    imageView.animationDuration = 1.0f;
//    imageView.animationRepeatCount = CGFLOAT_MAX;
//    [imageView startAnimating];

    NSString *string = @"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=gif动态图&step_word=&pn=0&spn=0&di=195898833020&pi=&rn=1&tn=baiduimagedetail&is=&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=2112420994%2C3341162753&os=3399572875%2C3652900895&simid=3445639069%2C499535019&adpicid=0&ln=1000&fr=ala&fmq=1447311552804_R&ic=undefined&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=&bdtype=0&objurl=http%3A%2F%2Fcomment.u17i.com%2F2010%2F12%2F20%2F16296_1292835060_nVX0bRu9lb07.gif&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3B780_z%26e3Bv54AzdH3FzAzdH3Frtv_z%26e3Bip4s%3F76s%3Dippr%25nA%25dF%25dFv544jgp_z%26e3B780t_z%26e3Bv54%25dFda8a%25dF8d%25dFda%25dF8mdlm_8dldbncama_gVXakR7lska0_z%26e3B2tu%26ptpsj%3D%25Eb%25bl%25BE%25E9%25BC%25Am%25Ec%25A9%25B9%25Ec%25bn%25bF%25Ec%25bA%25Ab%25Em%25ba%25b8%25Ec%25lB%25BE_z%26e3B2tu&gsm=0";
    NSString *newString = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", newString);
//    [imageView sd_setImageWithURL:[NSURL URLWithString:newString] placeholderImage:[UIImage imageNamed:@"1.gif"]];
    [imageView setImageWithURL:[NSURL URLWithString:newString]];
    
    [self.view addSubview:imageView];
}

/**
 GCD测试
 */
- (void)testGCD
{
    // 串行队列
//    [self serialQueue];
    
    // 并行队列
//    [self conurrentQueue];
    
    // 并发队列
//    [self globalQueue];
    
    // 只走一次
//    [self onlyOne];
    
    // 障碍队列
//    [self barrierQueue];
    
    // 延迟
//    [self delay];
    
    // 重复执行
//    [self applyQueue]d;
}
/**
 串行队列
 */
- (void)serialQueue
{
    dispatch_queue_t serialQueue = ("串行", DISPATCH_QUEUE_SERIAL);
    // 往队列里面添加任务
    dispatch_async(serialQueue, ^{
        NSLog(@"任务1执行%@", [NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"任务2执行%@", [NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"任务3执行%@", [NSThread currentThread]);
    });
    dispatch_async(serialQueue, ^{
        NSLog(@"任务4执行%@", [NSThread currentThread]);
    });
}
/**
 并行队列
 [self conurrentQueue];
 */
- (void)conurrentQueue
{
    // 创建一个并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("并行", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, ^{
        NSLog(@"任务1%@", [NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"任务2%@", [NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"任务3%@", [NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"任务4%@", [NSThread currentThread]);
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"******");
    });
    NSLog(@"&&&&&&");
}

/**
 并发队列
 [self globalQueue];
 */
- (void)globalQueue
{
    // 获取并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 创建一个分组
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSLog(@"请求0~1M的数据%@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"请求1~2M的数据%@", [NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"请求2~3M的数据%@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"所有分组任务都已经下载完成，开始拼接分段数据%@", [NSThread currentThread]);
    });
}
/**
 只走一次
 [self onlyOne];
 */
- (void)onlyOne
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"直走了一次");
    });
    NSLog(@"真的一次");
}
/**
 障碍队列
 [self barrierQueue];
 */
- (void)barrierQueue
{
    dispatch_queue_t queue = dispatch_queue_create("haha", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"任务A%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务B%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务C%@", [NSThread currentThread]);
    });
    // 创建一个障碍
    dispatch_barrier_async(queue, ^{
        NSLog(@"我是一个障碍");
    });
    dispatch_async(queue, ^{
        NSLog(@"任务D%@", [NSThread currentThread]);
    });
}
/**
 延迟
 [self delay];
 */
- (void)delay
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"我要执行了%@", [NSThread currentThread]);
    });
}
/**
 重复执行
 [self applyQueue];
 */
- (void)applyQueue
{
    dispatch_queue_t queue = dispatch_queue_create("hehe", DISPATCH_QUEUE_SERIAL);
    NSArray *array = @[@"aa", @"bb", @"cc", @"dd", @"ee"];
    dispatch_apply([array count], queue, ^(size_t index) {
        NSLog(@"%@, %@", [NSThread currentThread], array[index]);
    });
}

/**
 观察者的测试
 [self testObserverBetweenTwoVC];
 */
- (void)testObserverBetweenTwoVC
{
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self addObserver:nextVC forKeyPath:@"testObserver" options:NSKeyValueObservingOptionNew context:nil];
    self.testObserver = @"haha";
}

/**
 多线程测试
 [self testMultipleThread];
 */
- (void)testMultipleThread
{
    // 1.创建多线程对象
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(mutalbeThread:) object:@"test"];
//    [thread start];
    
    // 2.第二种方式
//    [NSThread detachNewThreadSelector:@selector(mutableThread:) toTarget:self withObject:nil];
    
    // 3、第三种方式
//    [self performSelectorInBackground:@selector(mutableThread:) withObject:nil];
    
    // 4、第四种方式
//    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
//    [operationQueue addOperationWithBlock:^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"zixiangchneg%d", i);
//        }
//    }];

    // 5、第五种方法
    // 创建一个线程队列
//    NSOperationQueue *threadQueue = [[NSOperationQueue alloc] init];
//    // 设置线程执行的并发数
//    threadQueue.maxConcurrentOperationCount = 1;
//    // 创建一个线程对象
//    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(mutableThread:) object:nil];
//    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(mutableThread2:) object:nil];
//    // 设置优先级
//    op2.queuePriority = NSOperationQueuePriorityHigh;
//    op1.queuePriority = NSOperationQueuePriorityLow;
//    [threadQueue addOperation:op1];
//    [threadQueue addOperation:op2];
    
    // 6、第六种方式：GCD
    dispatch_queue_t queue = dispatch_queue_create("test", NULL);
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"zixiangchneg%d", i);
//        }
//        if ([NSThread isMultiThreaded]) {
//            NSLog(@"duoxianchneg");
//        }
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            if ([NSThread isMainThread]) {
//                NSLog(@"isMainThread");
//            }
//        });
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            if ([NSThread isMainThread]) {
//                NSLog(@"isMainThread");
//            }
//        });
//    });
    // 通过此种方式，还是同步运行在当前线程上
//    dispatch_async(queue, ^{
//        // 当前线程
//        if ([NSThread isMultiThreaded]) {
//            NSLog(@"multiThread");
//        }
//    });
    
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"zhuxiangchneg%d", i);
    }
}
- (void)mutableThread:(NSString *)string
{
    @autoreleasepool {
        for (int i = 0; i < 10; i++) {
            NSLog(@"zixiangchneg%d", i);
        }
        
        // 跳到主线程执行
        [self performSelectorOnMainThread:@selector(mainThread) withObject:nil waitUntilDone:NO];
    }
}
- (void)mutableThread2:(NSString *)string
{
    for (int i = 0; i < 10; i++) {
        NSLog(@"zixiangchneg2%d", i);
    }
}
- (void)mainThread
{
    if ([NSThread isMainThread]) {
        NSLog(@"mainThread");
    }
}

/**
 测试封装的数据请求类
 [self testNetWorkerHelper];
 */
- (void)testNetWorkerHelper
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(10, 50, 20, 20);
    [button addTarget:self action:@selector(load) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)load
{
    NSDictionary *params = @{@"code" : @"101010300"};
    [DataHelper getWeatherData:params block:^(id result) {
        NSLog(@"%@", result);
    }];
}

/**
 测试kvc赋值
 [self testKVC];
 */
- (void)testKVC
{
    NSDictionary *dic = @{@"test1":@"test1", @"test2":@"test2", @"test3":@"test3", @"dictionary":@{@"test1":@"test1", @"test2":@"test2", @"test3":@"test3"}};
    TestModel *model = [[TestModel alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    NSLog(@"test finish");
}

/**
 测试tableView的didselect方法
 [self testTableViewDeselete];
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//        [self.navigationController pushViewController:[TestChildViewController new] animated:YES];
        [self.navigationController pushViewController:[TestViewController new] animated:YES];
    } else {
        TestButtonViewController *buttonVC = [[TestButtonViewController alloc] initWithNibName:@"TestButtonViewController" bundle:nil];;
        [self.navigationController pushViewController:buttonVC animated:YES];
    }
    
    // 通过URL Scheme 来实现调用另一个程序
//    NSString *string = @"iOSDevTips://?token=123abct&registered=1";
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:string]]) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
//    } else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
//                                                        message:[NSString stringWithFormat:
//                                                                 @"No custom URL defined for %@", string]
//                                                       delegate:self cancelButtonTitle:@"Ok"
//                                              otherButtonTitles:nil];
//        [alert show];
//        
    //    }
    // 测试协议是否能够继承
//    NextViewController *nextVC = [[NextViewController alloc] init];
//    nextVC.delegate = self;
//    [self.navigationController pushViewController:nextVC animated:YES];
}

// 测试协议是否能够继承
- (void)testViewControllerProtocolIsCanHabit
{
    NSLog(@"hehe");
}

/**
 测试字符数组
 [self testCharArray];
 */
- (void)testCharArray
{
//    /** 自定义进制(0,1没有加入,容易与o,l混淆) */
//    private static final char[] r=new char[]{'q', '8', 'e', 'w', 'a', 's', '2', 'd', 'z', 'x', '9', 'c', '7', 'p', '5', 'i', 'k', '3', 'm', 'j', 'u', '4', 'r', 'f', 'v', 'y', 'l', 't', 'n', '6', 'b', 'g', 'h'};
    NSArray *arr = @[@"a", @"d"];
    NSArray *array = @[@"q", @"8", @"e", @"w", @"a", @"s", @"2", @"d", @"z", @"x", @"9", @"c", @"7", @"p", @"5", @"i", @"k", @"3", @"m", @"j", @"u", @"4", @"r", @"f", @"v", @"y", @"l", @"t", @"n", @"6", @"b", @"g", @"h"];
//    /** (不能与自定义进制有重复) */
//    private static final char b='o';
//  	 
//    /** 进制长度 */
//    private static final int binLen=r.length;
//  	 
//    /** 序列最小长度 */
//    private static final int s=6;
//    
//    /**
//     * 根据ID生成六位随机码
//     * @param id ID
//     * @return 随机码
//     */
//    public static String toSerialCode(long id) {
//        char[] buf=new char[32];
//        int charPos=32;
//        
//        while((id / binLen) > 0) {
//            int ind=(int)(id % binLen);
//            // System.out.println(num + "-->" + ind);
//            buf[--charPos]=r[ind];
//            id /= binLen;
//        }
//        buf[--charPos]=r[(int)(id % binLen)];
//        // System.out.println(num + "-->" + num % binLen);
//        String str=new String(buf, charPos, (32 - charPos));
//        // 不够长度的自动随机补全
//        if(str.length() < s) {
//            StringBuilder sb=new StringBuilder();
//            sb.append(b);
//            Random rnd=new Random();
//            for(int i=1; i < s - str.length(); i++) {
//                sb.append(r[rnd.nextInt(binLen)]);
//            }
//            str+=sb.toString();
//        }
//        return str;
//    }
}

/**
 测试继承
 [self testInherit];
 */
//- (void)testInherit
//{
//    
//}

/**
 实现子类用于添加视图的方法
 */
//- (void)addSubViews
//{
////    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
////    [button setTitle:@"father" forState:UIControlStateNormal];
////    button.frame = CGRectMake(100, 200, 100, 30);
////    [self.view addSubview:button];
//}

/**
 测试第三方轮播图
 [self testRotatePicture];
 */
- (void)testRotatePicture
{
    NSArray *array = @[@"http://cdn1.liqu.cc/upload/chonggou/ad/41f4a628-49cc-43cb-b84f-5166d78b36ee.JPG", @"http://cdn1.liqu.cc/upload/chonggou/ad/631f7890-6242-4dbe-b6f1-9df59fd808fd.jpg"];
//    AdView *adView = [AdView adScrollViewWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 150) localImageLinkURL:@[@"1.jpg", @"2.jpg", @"3.jpg"] pageControlShowStyle:UIPageControlShowStyleCenter];
    AdView *adView = [AdView adScrollViewWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 150) imageLinkURL:[array mutableCopy] placeHoderImageName:@"1.jpg" pageControlShowStyle:UIPageControlShowStyleCenter];[adView setAdTitleArray:nil withShowStyle:AdTitleShowStyleRight];
    adView.adMoveTime = 5.0;
    //图片被点击后回调的方法
    __weak typeof(self) unself = self;
    
    adView.callBack = ^(NSInteger index,NSString * imageURL)
    {
        NSLog(@"%ld-----%@", index, imageURL);
    };
    [self.view addSubview:adView];
}

/**
 测试第三方引导图的淡出效果
 [self testMZGuidePages];
 */
- (void)testMZGuidePages
{
    NSArray *array = @[@"1.jpg", @"2.jpg", @"3.jpg"];
    MZGuidePages *mzGpc = [[MZGuidePages alloc] initWithImageDatas:array completion:^{
        [UIView animateWithDuration:2.0f animations:^{
            mzGpc.alpha = .0;
        } completion:^(BOOL finished) {
            [mzGpc removeFromSuperview];
        }];
    }];
//    MZGuidePages *mzGpc = [[MZGuidePages alloc] init];
//    mzGpc.imageDatas = array;
//    __weak typeof(MZGuidePages) *weakMZ = mzGpc;
//    mzGpc.buttonAction = ^{
//        [UIView animateWithDuration:2.0f animations:^{
//            weakMZ.alpha = .0;
//        } completion:^(BOOL finished) {
//            [weakMZ removeFromSuperview];
//        }];
//    };
    [self.view addSubview:mzGpc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];}

@end
