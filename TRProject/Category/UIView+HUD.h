//
//  UIView+HUD.h
//  TRProject
//
//  Created by tarena on 16/2/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (HUD)
//忙提示
- (void)showBusyHUD;
//文字提示
- (void)showWarning:(NSString *)warning;
//隐藏提示
- (void)hideBusyHUD;
@end












