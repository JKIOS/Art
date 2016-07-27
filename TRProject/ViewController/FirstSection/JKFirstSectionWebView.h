//
//  JKFirstSectionWebView.h
//  TRProject
//
//  Created by Tarena on 16/7/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface JKFirstSectionWebView : UIViewController
- (instancetype)initWithURL:(NSURL *) url;
@property (nonatomic) NSURL *url;
@end
