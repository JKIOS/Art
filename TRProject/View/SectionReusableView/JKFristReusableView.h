//
//  JKFristReusableView.h
//  TRProject
//
//  Created by Tarena on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKNetWorking.h"
#import "JKHomePageModel.h"
#import <iCarousel.h>
@interface JKFristReusableView : UICollectionReusableView
@property (nonatomic) iCarousel *ic;
@property (nonatomic) NSArray<JKHeaderDataModel *> *datalist;
@property (nonatomic) UIView *view;
@property (nonatomic) UICollectionView *heardView;
@property (nonatomic) NSArray<Labellist *> *labelList;
- (void)getDataListWith:(NSArray<Labellist *> *)labeList CompletionHandler:(void(^)())completionhandler;
@end
