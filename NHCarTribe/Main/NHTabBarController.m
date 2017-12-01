//
//  NHTabBarController.m
//  NHCarTribe
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHTabBarController.h"
#import "NHNavigationController.h"
#import "NHFirstViewController.h"
#import "NHFindViewController.h"
#import "NHBuyCarViewController.h"
#import "NHMyViewController.h"


@interface NHTabBarController ()<UITabBarControllerDelegate>

@end

@implementation NHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = kNHRGBAColor(23, 23, 23, 10);
    self.delegate = self;
//    [self addAllChildVcs];
    
    [self setButtonS];
}


- (void)addAllChildVcs{

    NHFirstViewController *first = [[NHFirstViewController alloc] init];
    
    NHFindViewController *find = [[NHFindViewController alloc] init];
    
    NHBuyCarViewController *buyCar = [[NHBuyCarViewController alloc] init];
    
    NHMyViewController *my = [[NHMyViewController alloc] init];
    
    self.viewControllers = @[first,find,buyCar,my];
}

- (void)setButtonS{
    
    UITabBarItem *firstItem =  self.tabBar.items[0];
    [self setTabbaritem:firstItem Title:@"首页" selectedImage:[UIImage imageNamed:@"tab_home_b"] NornalImage:[UIImage imageNamed:@"tab_home"]];
    
    UITabBarItem *second = self.tabBar.items[1];
    [self setTabbaritem:second Title:@"找车" selectedImage:[UIImage imageNamed:@"tab_find_b"] NornalImage:[UIImage imageNamed:@"tab_find"]];
    
    UITabBarItem *third = self.tabBar.items[2];
    [self setTabbaritem:third Title:@"买车" selectedImage:[UIImage imageNamed:@"tab_buy_b"] NornalImage:[UIImage imageNamed:@"tab_buy"]];
    
    UITabBarItem *four = self.tabBar.items[3];
    [self setTabbaritem:four Title:@"我的" selectedImage:[UIImage imageNamed:@"tab_my_b"] NornalImage:[UIImage imageNamed:@"tab_my"]];
}

//设置tabbarItem的背景图片
- (void)setTabbaritem:(UITabBarItem *)barItem Title:(NSString *)title selectedImage:(UIImage *)selectImage NornalImage:(UIImage *)noamal{
    [barItem setSelectedImage:[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [barItem setTitle:title];
    [barItem setImage:noamal];
    
    NSMutableDictionary *selected = [[NSMutableDictionary alloc] init];
    selected[NSForegroundColorAttributeName] = [UIColor whiteColor];
    selected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [barItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    
    NSMutableDictionary *normal = [[NSMutableDictionary alloc] init];
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [barItem setTitleTextAttributes:normal forState:UIControlStateNormal];
}


//tabbar的动画
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(nonnull UIViewController *)viewController
{
    NSMutableArray *arrayBt = [NSMutableArray array];
    for (id tabBt in [tabBarController.tabBar subviews])
    {
        if ([tabBt isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            [arrayBt addObject:tabBt];
        }
    }
    UIView *view =  [arrayBt objectAtIndex:tabBarController.selectedIndex];
    int i=0;
    for (UIView *tmp in [view subviews])
    {
        i++;
        if ([tmp isKindOfClass:  NSClassFromString( @"UITabBarSwappableImageView")])
        {
            [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:10 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                [tmp.layer setValue:@(2.0) forKeyPath:@"transform.scale"];
                [tmp.layer setValue:@(1.5) forKeyPath:@"transform.scale"];
                [tmp.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:^(BOOL finished) {
                [tmp.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            }];
            break;
        }
    }
}



@end
