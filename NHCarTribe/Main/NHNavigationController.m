//
//  NHNavigationController.m
//  NHCarTribe
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHNavigationController.h"

@interface NHNavigationController ()

@end

@implementation NHNavigationController
/**
 *  当导航控制器的view创建完毕就调用
 */
- (void)viewDidLoad {
    [super viewDidLoad];

}

/**
 *  当第一次使用这个类的时候调用1次
 */
+ (void)initialize{
//    [self setnav];
//    kNHLog(@"");
}


+ (void)setnav{

    UINavigationBar *appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigation"] forBarMetrics:UIBarMetricsDefault];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSLog(@"%s",__func__);
}
@end
