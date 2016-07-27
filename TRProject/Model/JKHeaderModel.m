//
//  JKHeaderModel.m
//  TRProject
//
//  Created by Tarena on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHeaderModel.h"

@implementation JKHeaderModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[JKHeaderDataModel class]};
}
@end
@implementation JKHeaderDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


