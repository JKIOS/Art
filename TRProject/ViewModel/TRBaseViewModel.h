//
//  TRBaseViewModel.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMRequestMode) {
    VMRequestModeRefresh,
    VMRequestModeMore,
};

@interface TRBaseViewModel : NSObject{
    NSURLSessionDataTask *_dataTask;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;

@end
