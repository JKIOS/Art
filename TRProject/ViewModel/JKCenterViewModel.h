//
//  JKCenterViewModel.h
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "JKCenterModel.h"
@interface JKCenterViewModel : TRBaseViewModel
@property (nonatomic, strong) NSMutableArray<JKCenterDataModel *> *dataList;
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSInteger num;
@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;
- (NSString *)nameForRow:(NSInteger)row;
- (NSString *)galleryName:(NSInteger)row;
@end
