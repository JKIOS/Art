//
//  JKNetWorking.m
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKNetWorking.h"
#import "JKHomePageModel.h"
@implementation JKNetWorking
+ (id)getHomePageWithPage:(NSInteger)page CompletionHandler:(void (^)(JKHomePageModel *, NSError *))completionhandler{
    NSString *path = [NSString stringWithFormat:kHomePagePath, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandler ?: completionhandler([JKHomePageModel parseJSON:jsonObject], error);
    }];
}
+ (id)getHeaderCompletionHandler:(void (^)(JKHeaderModel *, NSError *))completionhandler{
    return [self GET:kHeaderPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandler ?: completionhandler([JKHeaderModel parseJSON:jsonObject], error);
    }];
}
+ (id)getFirstNextWith:(NSInteger)columnId WithPage:(NSInteger)page CompletionHandler:(void (^)(JKFirstSectionModel *, NSError *))completionhandler{
    NSString *path = [NSString stringWithFormat:kFirstNextPath, columnId, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
                !completionhandler ?: completionhandler([JKFirstSectionModel parseJSON:jsonObject],error);
            }];
}
+ (id)getCenterWithPage:(NSInteger)page CompletionHandler:(void (^)(JKCenterModel *, NSError *))completionhandler{
    NSString *path = [NSString stringWithFormat:kCenterPath, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandler ?: completionhandler([JKCenterModel parseJSON:jsonObject], error);
    }];
}
+ (id)getEnjoyData:(EnjoyType)enjoyType WithPage:(NSInteger)page CompletionHandler:(void (^)(JKEnjoyModel *, NSError *))completionhandler{
    NSString *path = nil;
    switch (enjoyType) {
        case EnjoyTypeYiShu:{
            path = kYiShuPath;
        }
            break;
        case EnjoyTypeSheJi:{
            path = kSheJiPath;
        }
            break;
        case EnjoyTypeSheYing:{
            path = kSheYingPath;
        }
            break;
        case EnjoyTypeShengHuo:{
            path = kShengHuoPath;
        }
            break;
        case EnjoyTypeDongMan:{
            path = kDongManPath;
        }
            break;
        case EnjoyTypeShouCang:{
            path = kShouCangPath;
        }
            break;
    }
    path = [NSString stringWithFormat:path, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandler ?: completionhandler([JKEnjoyModel parseJSON:jsonObject], error);
    }];
}
+ (id)getHotWorksWithPage:(NSInteger)page CompletionHandler:(void (^)(JKHotWorksModel *, NSError *))completionhandler{
    NSString *path = [NSString stringWithFormat:kHotWorksPath, page];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionhandler ?: completionhandler([JKHotWorksModel parseJSON:jsonObject], error);
    }];
}
@end
