//
//  JKEnjoyViewController.h
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKEnjoyViewModel.h"
#import "JKEnjoyViewCell.h"
@interface JKEnjoyViewController : UITableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style WithType:(EnjoyType)type;
@property (nonatomic) EnjoyType type;
@property (nonatomic) JKEnjoyViewModel *enjoyVM;
@end
