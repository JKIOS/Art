//
//  JKFirstSectionModel.h
//  TRProject
//
//  Created by Tarena on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKFirstSectionDataModel,Topics;
@interface JKFirstSectionModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) JKFirstSectionDataModel *data;

@end
@interface JKFirstSectionDataModel : NSObject

@property (nonatomic, copy) NSString *galleryPic;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *galleryDescTxt;

@property (nonatomic, assign) NSInteger employeeId;

@property (nonatomic, assign) NSInteger attentionTimes;

@property (nonatomic, assign) NSInteger exhibitNum;

@property (nonatomic, copy) NSString *galleryName;

@property (nonatomic, copy) NSString *telNo;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *updateAt;

@property (nonatomic, copy) NSString *shareUrl;

@property (nonatomic, copy) NSString *galleryDesc;

@property (nonatomic, assign) BOOL attention;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *galleryDescHtml;

@property (nonatomic, copy) NSString *isRecommend;

@property (nonatomic, assign) NSInteger collectionNum;

@property (nonatomic, assign) NSInteger collectionNumTwo;

@property (nonatomic, assign) NSInteger workNum;

@property (nonatomic, strong) NSArray<Topics *> *topics;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) BOOL collection;

@end

@interface Topics : NSObject

@property (nonatomic, copy) NSString *columnListId;

@property (nonatomic, assign) NSInteger isDeleted;

@property (nonatomic, assign) NSInteger topicType;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *marketingDesc;

@property (nonatomic, copy) NSString *scourceType;

@property (nonatomic, copy) NSString *curiosityPicUrl;

@property (nonatomic, assign) NSInteger isTopicParise;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger praiseNum;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, assign) NSInteger topicHeadType;

@property (nonatomic, copy) NSString *topicLabel;

@property (nonatomic, copy) NSString *topicPic;

@property (nonatomic, assign) NSInteger isWatch;
//id -> Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *scourceTable;

@property (nonatomic, assign) NSInteger isEnterfor;

@property (nonatomic, assign) NSInteger topicLabelId;

@property (nonatomic, assign) NSInteger listOrder;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) BOOL collection;

@end

