
/** 导航栏的隐藏与显示 **/
#define kStatusHidden [UIApplication sharedApplication].statusBarHidden = YES
#define kStatusShow [UIApplication sharedApplication].statusBarHidden = NO

/** 导航栏字体的格式设置 **/
#define kStatusBarStyleLightContent [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent
#define kStatusBarStyleDefault [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault

/** 发送通知与接收通知 **/
#define kPostNSNotificaction(NAME, OBJECT) [[NSNotificationCenter defaultCenter] postNotificationName:NAME object:OBJECT]
#define kAddNSNotification(OBSERVER, SELE, NAME, OBJECT) [[NSNotificationCenter defaultCenter] addObserver:OBSERVER selector:@selector(SELE) name:NAME object:OBJECT]