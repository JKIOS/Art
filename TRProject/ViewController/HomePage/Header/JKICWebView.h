//
//  JKICWebView.h
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKICWebView : UIViewController
- (instancetype)initWithURL:(NSURL *) url;
@property (nonatomic) NSURL *url;
@end
