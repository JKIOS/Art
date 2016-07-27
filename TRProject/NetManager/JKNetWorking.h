//
//  JKNetWorking.h
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKHomePageModel.h"
#import "JKHeaderModel.h"
#import "JKFirstSectionModel.h"
#import "JKCenterModel.h"
#import "JKEnjoyModel.h"
#import "JKHotWorksModel.h"
typedef NS_ENUM(NSUInteger, EnjoyType){
    //艺术
    EnjoyTypeYiShu,
    //设计
    EnjoyTypeSheJi,
    //摄影
    EnjoyTypeSheYing,
    //生活
    EnjoyTypeShengHuo,
    //动漫
    EnjoyTypeDongMan,
    //收藏
    EnjoyTypeShouCang,
};
@interface JKNetWorking : NSObject
+ (id)getHomePageWithPage:(NSInteger)page CompletionHandler:(void(^)(JKHomePageModel *model, NSError *error))completionhandler;
+ (id)getHeaderCompletionHandler:(void(^)(JKHeaderModel *model, NSError *error))completionhandler;
+ (id)getFirstNextWith:(NSInteger)columnId WithPage:(NSInteger)page CompletionHandler:(void(^)(JKFirstSectionModel *model, NSError *error))completionhandler;
+ (id)getCenterWithPage:(NSInteger)page CompletionHandler:(void(^)(JKCenterModel *model, NSError *error))completionhandler;
+ (id)getEnjoyData:(EnjoyType)enjoyType WithPage:(NSInteger)page
 CompletionHandler:(void(^)(JKEnjoyModel *model, NSError *error))completionhandler;
+ (id)getHotWorksWithPage:(NSInteger)page CompletionHandler:(void(^)(JKHotWorksModel *model, NSError *error))completionhandler;
@end
