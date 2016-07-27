//
//  JKPageViewController.m
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKPageViewController.h"
#import "JKEnjoyViewController.h"
@implementation JKPageViewController
- (instancetype)init{
    if (self=[super init]) {
        self.title = @"图文欣赏";
        self.tabBarItem.image = [UIImage imageNamed:@"display@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.29957.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"display-press@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.14993.000.00."];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (NSArray *)titles{
    return @[@"艺术", @"设计", @"摄影", @"生活", @"动漫", @"收藏"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    JKEnjoyViewController *vc = [[JKEnjoyViewController alloc]initWithStyle:UITableViewStylePlain WithType:index];
    return vc;
}
@end
