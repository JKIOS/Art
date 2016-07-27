//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "JKNetWorking.h"
#import "JKHomePageViewController.h"
#import "JKPageViewController.h"
#import "JKHotWorksView.h"
#import "JKSettingViewController.h"
@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    JKHomePageViewController *homePageVC = [JKHomePageViewController new];
    UINavigationController *oneNavi = [[UINavigationController alloc]initWithRootViewController:homePageVC];
    UINavigationController *twoNavi = [[UINavigationController alloc] initWithRootViewController:[JKPageViewController new]];
    UINavigationController *threeNavi = [[UINavigationController alloc] initWithRootViewController:[JKHotWorksView new]];
    UINavigationController *fourNavi = [[UINavigationController alloc]initWithRootViewController:[JKSettingViewController new]];
    UITabBarController *tabBar = [UITabBarController new];
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barTintColor = kRGBColor(107, 185, 255, 1.0);
    [UITabBar appearance].translucent = NO;
    tabBar.viewControllers = @[oneNavi,twoNavi,threeNavi,fourNavi];
    self.window.rootViewController = tabBar;
    self.window.tintColor = [UIColor blackColor];
    return YES;
}

@end
