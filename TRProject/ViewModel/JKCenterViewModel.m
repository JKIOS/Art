//
//  JKCenterViewModel.m
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKCenterViewModel.h"
#import "JKNetWorking.h"
@implementation JKCenterViewModel
- (NSMutableArray<JKCenterDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
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
    _dataTask = [JKNetWorking getCenterWithPage:tmpnum CompletionHandler:^(JKCenterModel *model, NSError *error) {
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
            _num = tmpnum;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)rowNumber{
    return self.dataList.count;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.dataList[row].exhibitArtistList.firstObject.name;
}
- (NSString *)galleryName:(NSInteger)row{
    return self.dataList[row].exhibitArtistList.firstObject.galleryName;
}
@end
