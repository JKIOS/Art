//
//  JKEnjoyViewModel.m
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKEnjoyViewModel.h"

@implementation JKEnjoyViewModel
- (NSMutableArray<JKEnjoyDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
- (instancetype)initWithType:(EnjoyType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpPage = 1;
            break;
        }
        case VMRequestModeMore: {
            tmpPage = _page + 1;
            break;
        }
    }
    _dataTask = [JKNetWorking getEnjoyData:self.type WithPage:tmpPage CompletionHandler:^(JKEnjoyModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (model.data.count == 10) {
                _hasMore = YES;
            }else{
                _hasMore = NO;
            }
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page = tmpPage;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.dataList[row].topicPic.yx_URL;
}
- (NSString *)authorForRow:(NSInteger)row{
    return self.dataList[row].author;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].topicName;
}
- (NSString *)numForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld阅读",self.dataList[row].viewerNum];
}

@end
