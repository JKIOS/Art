//
//  JKCenterModel.h
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKCenterDataModel,Exhibitartistlist;
@interface JKCenterModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) NSArray<JKCenterDataModel *> *data;

@end
@interface JKCenterDataModel : NSObject

@property (nonatomic, strong) NSArray<Exhibitartistlist *> *exhibitArtistList;

@property (nonatomic, assign) NSInteger totalViewNums;

@property (nonatomic, copy) NSString *worksSrc;

@end

@interface Exhibitartistlist : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *workSrc;

@property (nonatomic, assign) NSInteger galleryId;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger goodTimes;

@property (nonatomic, copy) NSString *worksPic;

@property (nonatomic, copy) NSString *exhibitStartDate;

@property (nonatomic, copy) NSString *exhibitCity;

@property (nonatomic, assign) NSInteger worksId;

@property (nonatomic, copy) NSString *galleryName;

@property (nonatomic, copy) NSString *worksHeight;

@property (nonatomic, copy) NSString *worksWidth;

@property (nonatomic, copy) NSString *worksName;

@property (nonatomic, copy) NSString *exhibitEndDate;

@property (nonatomic, copy) NSString *headPic;

@property (nonatomic, copy) NSString *name;

@end

