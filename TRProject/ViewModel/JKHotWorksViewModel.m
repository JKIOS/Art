//
//  JKHotWorksViewModel.m
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHotWorksViewModel.h"
#import "JKNetWorking.h"
@implementation JKHotWorksViewModel
- (NSMutableArray<JKHotWorksDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    switch (requestMode) {
        case VMRequestModeRefresh: {
            tmpPage = 0;
            break;
        }
        case VMRequestModeMore: {
            tmpPage = _page + 1;
            break;
        }
    }
    _dataTask = [JKNetWorking getHotWorksWithPage:tmpPage CompletionHandler:^(JKHotWorksModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
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
    return self.dataList[row].exhibitWorkVo.worksPic.yx_URL;
}
- (NSString *)authorForRow:(NSInteger)row{
    return self.dataList[row].exhibitWorkVo.author;
}
- (NSString *)goodTimesForRow:(NSInteger)row{
    return @(self.dataList[row].exhibitWorkVo.goodTimes).stringValue;
}
- (NSString *)workNameForRow:(NSInteger)row{
    return self.dataList[row].exhibitWorkVo.workName;
}
@end
