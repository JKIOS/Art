//
//  JKEnjoyViewModel.h
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "JKNetWorking.h"
#import "JKEnjoyModel.h"
@interface JKEnjoyViewModel : TRBaseViewModel
- (instancetype)initWithType:(EnjoyType)type;
@property (nonatomic) EnjoyType type;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray<JKEnjoyDataModel *> *dataList;
@property (nonatomic) NSInteger rowNumber;
- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)authorForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)numForRow:(NSInteger)row;
@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;
@end
