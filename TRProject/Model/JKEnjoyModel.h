//
//  JKEnjoyModel.h
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKEnjoyDataModel;
@interface JKEnjoyModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<JKEnjoyDataModel *> *data;

@end
@interface JKEnjoyDataModel: NSObject

@property (nonatomic, assign) NSInteger topicType;

@property (nonatomic, assign) NSInteger isDeleted;

@property (nonatomic, copy) NSString *marketingDesc;

@property (nonatomic, assign) NSInteger joinNum;

@property (nonatomic, copy) NSString *scourceType;

@property (nonatomic, copy) NSString *curiosityPicUrl;

@property (nonatomic, assign) NSInteger isTopicParise;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger praiseNum;

@property (nonatomic, assign) NSInteger topicHeadType;

@property (nonatomic, copy) NSString *topicPic;

@property (nonatomic, assign) NSInteger viewerNumBase;

@property (nonatomic, assign) NSInteger isWatch;
//id -> ID
@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *scourceTable;

@property (nonatomic, assign) NSInteger isEnterfor;

@property (nonatomic, assign) NSInteger listOrder;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) BOOL collection;

@end

