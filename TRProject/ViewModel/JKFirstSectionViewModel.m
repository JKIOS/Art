//
//  JKFirstSectionViewModel.m
//  TRProject
//
//  Created by Tarena on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFirstSectionViewModel.h"
#import "JKNetWorking.h"
@implementation JKFirstSectionViewModel
- (NSMutableArray<Topics *> *)topics{
    if (!_topics) {
        _topics = [NSMutableArray new];
    }
    return _topics;
}
- (instancetype)initWithColumnId:(NSInteger)columnId{
    if (self = [super init]) {
        _columnId = columnId;
    }
    return self;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpnum = 1;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpnum = 1;
            break;
        }
        case VMRequestModeMore: {
            tmpnum = _num + 1;
            break;
        }
    }
    _dataTask = [JKNetWorking getFirstNextWith:self.columnId WithPage:tmpnum CompletionHandler:^(JKFirstSectionModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (model.data.topics.count == 2) {
                _hasMore = YES;
            }else{
                _hasMore = NO;
            }
            if (requestMode == VMRequestModeRefresh) {
                _firstModel = model;
                [self.topics removeAllObjects];
            }
            [self.topics addObjectsFromArray:model.data.topics];
            _num = tmpnum;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (Topics *)modelForRow:(NSInteger)row{
    return self.topics[row];
}
- (NSString *)name:(NSInteger)row{
    return [self modelForRow:row].topicName;
}
- (NSString *)numlable:(NSInteger)row{
    return @([self modelForRow:row].viewerNum).stringValue;
}
- (NSURL *)imageVM:(NSInteger)row{
    return [self modelForRow:row].topicPic.yx_URL;
}
- (NSInteger)rowNumber{
    return self.topics.count;
}
@end
