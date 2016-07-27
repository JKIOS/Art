//
//  JKEnjoyModel.m
//  TRProject
//
//  Created by HJK on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKEnjoyModel.h"

@implementation JKEnjoyModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[JKEnjoyDataModel class]};
}

@end
@implementation JKEnjoyDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


