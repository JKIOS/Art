//
//  NSObject+AFNetworking.h
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>



@interface NSObject (AFNetworking)

+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObject, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObject, NSError *error))completionHandler;

@end











