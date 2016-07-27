//
//  JKHotWorksView.h
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKHotWorksCell.h"
#import "JKHotWorksViewModel.h"
@interface JKHotWorksView : UITableViewController
@property (nonatomic) JKHotWorksViewModel *hotworksVM;
@end
