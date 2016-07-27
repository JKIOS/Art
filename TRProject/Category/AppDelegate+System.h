//
//  AppDelegate+System.h
//  TRProject
//
//  Created by jiyingxin on 16/2/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworkReachabilityManager.h>

@interface AppDelegate (System)
/** 当前网络是否在线: 在线:WIFI + 手机网络 */
@property (nonatomic, getter = isOnLine, readonly) BOOL onLine;
/** 当前网络状态: 无网络, 未知, WIFI, 手机网络 */
@property (nonatomic, readonly) AFNetworkReachabilityStatus netReachStatus;

/** 进行一些全局的配置, 如 开启网络监测, 网络活动提示, 初始化DDLog 等... */
- (void)setupGlobalConfig;

@end
