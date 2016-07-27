//
//  JKFirstSectionModel.m
//  TRProject
//
//  Created by Tarena on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKFirstSectionModel.h"

@implementation JKFirstSectionModel

@end
@implementation JKFirstSectionDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"topics":[Topics class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation Topics
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


