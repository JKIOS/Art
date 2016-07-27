//
//  JKSettingViewController.m
//  TRProject
//
//  Created by Tarena on 16/7/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKSettingViewController.h"
#import "JKSettingViewCell.h"
#import "JKMyViewController.h"
@interface JKSettingViewController ()
@end

@implementation JKSettingViewController
- (instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.title = @"设置";
        self.tabBarItem.image = [UIImage imageNamed:@"me@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.61108.000.00."];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"me-press@2x.png.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.8714.000.00."];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JKSettingViewCell class] forCellReuseIdentifier:@"Cell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JKSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = @"清除缓存";
//        cell.detailTextLabel.text = [self getCacheSize];
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [[SDImageCache sharedImageCache] calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
            
            NSString *message = [NSString stringWithFormat:@"您确认清除%.2f M缓存吗？",totalSize/1024.0/1024];
            UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //清除内存缓存
                [[SDImageCache sharedImageCache] clearMemory];
                //清除磁盘缓存
                [[SDImageCache sharedImageCache] clearDisk];
                //清除系统网络请求时缓存的数据
                [[NSURLCache sharedURLCache]removeAllCachedResponses];
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            [ac addAction:action1];
            [ac addAction:action2];
            [self presentViewController:ac animated:YES completion:nil];
            
            
        }];
        
        
        
        
        
}

@end
