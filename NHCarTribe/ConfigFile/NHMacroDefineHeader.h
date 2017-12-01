//
//  NHMacroDefineHeader.h
//  NHBaseProjectFramework
//
//  Created by simope on 16/7/12.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#ifndef NHMacroDefineHeader_h
#define NHMacroDefineHeader_h


/*****************************获取通知中心******************************/
#define kNHNotificationCenter [NSNotificationCenter defaultCenter]


/*****************************设置随机颜色******************************/
#define kNHRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]


/*****************************设置RGB颜色/设置RGBA颜色******************************/
#define kNHRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kNHBlackColor      [UIColor blackColor]
#define kNHDarkGrayColor   [UIColor darkGrayColor]
#define kNHLightGrayColor  [UIColor lightGrayColor]
#define kNHWhiteColor      [UIColor whiteColor]
#define kNHGrayColor       [UIColor grayColor]
#define kNHRedColor        [UIColor redColor]
#define kNHGreenColor      [UIColor greenColor]
#define kNHBlueColor       [UIColor blueColor]
#define kNHCyanColor       [UIColor cyanColor]
#define kNHYellowColor     [UIColor yellowColor]
#define kNHMagentaColor    [UIColor magentaColor]
#define kNHOrangeColor     [UIColor orangeColor]
#define kNHPurpleColor     [UIColor purpleColor]
#define kNHBrownColor      [UIColor brownColor]
#define kNHClearColor      [UIColor clearColor]


/*****************************定义字体******************************/
#define kNHFont(fontSize) [UIFont fontWithName:@"Helvetica-Bold" size:fontSize]
#define kNHRANGE(loc,len)   NSMakeRange(loc,len)


/*****************************自定义高效率的 NSLog******************************/
//项目开发中，我们会在许多地方加上Log，但是发布的时候又不想用这些Log，我们也不可能一个一个的删除，所以自定义Log是必然的！
#ifdef DEBUG
#define kNHLog(...) NSLog(@"\n<%@> %s 第%d行 \n %@\n",NSStringFromClass([self class]),__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define kNHLog(...)
#endif


/*****************************不需要打印时间戳等信息，使用如下宏定义******************************/
#ifdef DEBUG
#define kNHNSLog(FORMAT, ...) fprintf(stderr,"%s\n",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define kNHNSLog(...)
#endif


/*****************************打印日志,当前行 并弹出一个警告******************************/
#ifdef DEBUG
#   define kNHALERTLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define kNHALERTLog(...)
#endif


/*****************************弱引用/强引用******************************/
#define kNHWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kNHStrongSelf(type)  __strong typeof(type) type = weak##type;


/*****************************设置 view 圆角和边框******************************/
#define kNHViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


/*****************************由角度转换弧度 由弧度转换角度******************************/
#define kNHDegreesToRadian(x) (M_PI * (x) / 180.0)
#define kNHRadianToDegrees(radian) (radian*180.0)/(M_PI)


/*****************************获取view的frame/图片资源******************************/
//获取view的frame
#define kNHGetViewWidth(view)  view.frame.size.width
#define kNHGetViewHeight(view) view.frame.size.height
#define kNHGetViewX(view)      view.frame.origin.x
#define kNHGetViewY(view)      view.frame.origin.y
//获取图片资源
#define kNHGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


/*****************************获取当前语言******************************/
#define kNHCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


/***************************** ARC 和 MRC******************************/
#if __has_feature(objc_arc)
// ARC
#else
// MRC
#endif


/*****************************判断当前的iPhone设备/系统版本******************************/
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))


/*******************判断是真机还是模拟器****************/
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


/*****************获取通知中心********************/
#define BKNotificationCenter [NSNotificationCenter defaultCenter]


/*****************************沙盒目录文件******************************/
//获取temp
#define kNHPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kNHPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kNHPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
#define kNHLocalUserinfo               [NSUserDefaults standardUserDefaults]
#define kNHGetLocalUserinfo(key)       [[NSUserDefaults standardUserDefaults] objectForKey:(key)]
#define kNHSetLocalUserinfos(obj,key)  [[NSUserDefaults standardUserDefaults] setObject:(obj) forKey:(key)]


/*****************************GCD 的宏定义******************************/
//GCD - 一次性执行
#define kNHDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define kNHDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define kNHDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


/*****************************设置加载提示框（第三方框架：Toast）******************************/
//此宏定义非常好用，但是小伙伴需要CocoaPods导入第三方框架：Toast
//使用方法如下： LRToast(@"网络加载失败");
#define kNHToast(str)              CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:0.6 position:CSToastPositionCenter style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\


/*****************************设置加载提示框（第三方框架：MBProgressHUD）******************************/
// 加载
#define kNHShowNetworkActivityIndicator() [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
// 收起加载
#define kNHHideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
// 设置加载
#define kNHNetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x
#define kNHWindow [UIApplication sharedApplication].keyWindow
#define kNHBackView         for (UIView *item in kWindow.subviews) { \
if(item.tag == 10000) \
{ \
[item removeFromSuperview]; \
UIView * aView = [[UIView alloc] init]; \
aView.frame = [UIScreen mainScreen].bounds; \
aView.tag = 10000; \
aView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3]; \
[kWindow addSubview:aView]; \
} \
} \
#define kNHShowHUDAndActivity kBackView;[MBProgressHUD showHUDAddedTo:kWindow animated:YES];kShowNetworkActivityIndicator()
#define kNHHiddenHUD [MBProgressHUD hideAllHUDsForView:kWindow animated:YES]
#define kNHRemoveBackView         for (UIView *item in kWindow.subviews) { \
if(item.tag == 10000) \
{ \
[UIView animateWithDuration:0.4 animations:^{ \
item.alpha = 0.0; \
} completion:^(BOOL finished) { \
[item removeFromSuperview]; \
}]; \
} \
} \
#define kNHHiddenHUDAndAvtivity kRemoveBackView;kHiddenHUD;HideNetworkActivityIndicator()


#endif /* NHHeader_h */
