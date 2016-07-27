//
//  JKHomePageModel.m
//  TRProject
//
//  Created by Tarena on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHomePageModel.h"

@implementation JKHomePageModel

@end
@implementation JKHomePageDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"galleryList":[Gallerylist class],
             @"labelList":[Labellist class],
             @"imageTextList":[Imagetextlist class]};
}

@end


@implementation Gallerylist
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation Labellist
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


@implementation Imagetextlist
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"iD":@"id"};
}
@end


