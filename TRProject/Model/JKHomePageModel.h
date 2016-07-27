//
//  JKHomePageModel.h
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKHomePageDataModel,Gallerylist,Labellist,Imagetextlist;
@interface JKHomePageModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) JKHomePageDataModel *data;


@end
@interface JKHomePageDataModel : NSObject

@property (nonatomic, strong) NSArray<Gallerylist *> *galleryList;

@property (nonatomic, strong) NSArray<Labellist *> *labelList;

@property (nonatomic, strong) NSArray<Imagetextlist *> *imageTextList;

@end

@interface Gallerylist : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger employeeId;

@property (nonatomic, copy) NSString *galleryDesc;

@property (nonatomic, copy) NSString *galleryPic;

@property (nonatomic, copy) NSString *isRecommend;

@property (nonatomic, assign) NSInteger listOrder;

@property (nonatomic, copy) NSString *galleryName;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, assign) NSInteger viewerNumBase;

@property (nonatomic, assign) NSInteger attentionTimes;

@property (nonatomic, assign) NSInteger collectionNum;

@property (nonatomic, assign) BOOL publish;

@property (nonatomic, assign) BOOL collection;

@property (nonatomic, copy) NSString *status;

@end

@interface Labellist : NSObject

@property (nonatomic, copy) NSString *createAt;
// id -> Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *labelPic;

@property (nonatomic, copy) NSString *labelPic2;

@property (nonatomic, copy) NSString *labelEn;

@end

@interface Imagetextlist : NSObject

@property (nonatomic, assign) NSInteger topicType;

@property (nonatomic, assign) NSInteger isDeleted;

@property (nonatomic, copy) NSString *marketingDesc;

@property (nonatomic, copy) NSString *scourceType;

@property (nonatomic, copy) NSString *curiosityPicUrl;

@property (nonatomic, assign) NSInteger isTopicParise;

@property (nonatomic, copy) NSString *publishAt;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger praiseNum;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, assign) NSInteger topicHeadType;

@property (nonatomic, copy) NSString *topicLabel;

@property (nonatomic, copy) NSString *topicPic;

@property (nonatomic, assign) NSInteger isWatch;
// id -> iD
@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, copy) NSString *scourceTable;

@property (nonatomic, assign) NSInteger isEnterfor;

@property (nonatomic, assign) NSInteger topicLabelId;

@property (nonatomic, assign) NSInteger listOrder;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, assign) BOOL collection;

@end

