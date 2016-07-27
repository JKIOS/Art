//
//  JKHotWorksViewModel.h
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "JKHotWorksModel.h"
@interface JKHotWorksViewModel : TRBaseViewModel
@property (nonatomic) NSMutableArray<JKHotWorksDataModel *> *dataList;
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSInteger page;
- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)authorForRow:(NSInteger)row;
- (NSString *)workNameForRow:(NSInteger)row;
- (NSString *)goodTimesForRow:(NSInteger)row;


@end
