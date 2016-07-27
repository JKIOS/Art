//
//  JKHotWorksModel.h
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKHotWorksDataModel,Exhibitworkvo,Exhibitworkcommentvo;
@interface JKHotWorksModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<JKHotWorksDataModel *> *data;

@end
@interface JKHotWorksDataModel : NSObject

@property (nonatomic, assign) NSInteger totalConmment;

@property (nonatomic, strong) Exhibitworkcommentvo *exhibitWorkCommentVo;

@property (nonatomic, strong) Exhibitworkvo *exhibitWorkVo;

@end

@interface Exhibitworkvo : NSObject
// id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger praiseCount;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger goodTimes;

@property (nonatomic, assign) NSInteger exhibitId;

@property (nonatomic, copy) NSString *worksPic;

@property (nonatomic, assign) NSInteger shareNum;

@property (nonatomic, assign) NSInteger viewerNum;

@property (nonatomic, copy) NSString *updateAt;

@property (nonatomic, assign) BOOL praise;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, copy) NSString *worksHeight;

@property (nonatomic, copy) NSString *worksWidth;

@property (nonatomic, copy) NSString *workName;

@end

@interface Exhibitworkcommentvo : NSObject
// id -> Id
@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) NSInteger verifyStatus;

@property (nonatomic, copy) NSString *commentTxt;

@property (nonatomic, assign) NSInteger goodTimes;

@property (nonatomic, assign) NSInteger workId;

@property (nonatomic, assign) NSInteger parentCommentId;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) BOOL praise;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, assign) NSInteger replyNum;

@property (nonatomic, assign) NSInteger parentId;

@end

