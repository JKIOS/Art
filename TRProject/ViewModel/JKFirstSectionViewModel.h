//
//  JKFirstSectionViewModel.h
//  TRProject
//
//  Created by Tarena on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "JKFirstSectionModel.h"
@interface JKFirstSectionViewModel : TRBaseViewModel
@property (nonatomic) NSMutableArray<Topics *> *topics;
@property (nonatomic) NSInteger columnId;
@property (nonatomic) JKFirstSectionModel *firstModel;
- (instancetype)initWithColumnId:(NSInteger)columnId;
@property (nonatomic) NSInteger rowNumber;
- (Topics *)modelForRow:(NSInteger)row;
- (NSString *)name:(NSInteger)row;
- (NSString *)numlable:(NSInteger)row;
- (NSURL *)imageVM:(NSInteger)row;
@property (nonatomic) NSInteger num;
@property (nonatomic ,getter=isHasMore, readonly) BOOL hasMore;
@property (nonatomic) NSURL *heardView;
@end
