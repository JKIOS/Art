//
//  JKHotWorksModel.m
//  TRProject
//
//  Created by Tarena on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKHotWorksModel.h"

@implementation JKHotWorksModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[JKHotWorksDataModel class]};
}
@end
@implementation JKHotWorksDataModel

@end


@implementation Exhibitworkvo
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


@implementation Exhibitworkcommentvo
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"Id":@"id"};
}
@end


