//
//  JKHeaderModel.h
//  TRProject
//
//  Created by Tarena on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKHeaderDataModel;
@interface JKHeaderModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<JKHeaderDataModel *> *data;

@end
@interface JKHeaderDataModel : NSObject

@property (nonatomic, assign) NSInteger topicType;

@property (nonatomic, copy) NSString *marketingDesc;

@property (nonatomic, assign) BOOL likes;

@property (nonatomic, copy) NSString *scourceType;

@property (nonatomic, copy) NSString *curiosityPicUrl;

@property (nonatomic, copy) NSString *publishAt;

@property (nonatomic, assign) NSInteger topicGroupId;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger businessId;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, assign) NSInteger joinNums;

@property (nonatomic, assign) NSInteger topicHeadType;

@property (nonatomic, assign) NSInteger activityId;

@property (nonatomic, copy) NSString *topicLabel;

@property (nonatomic, copy) NSString *topicLabelDefine;

@property (nonatomic, copy) NSString *topicPic;

@property (nonatomic, copy) NSString *updateAt;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *topicDesc;

@property (nonatomic, assign) NSInteger isEnterfor;

@property (nonatomic, assign) NSInteger listOrder;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, copy) NSString *showTopicHead;

@end

