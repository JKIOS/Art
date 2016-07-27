//
//  JKCenterModel.m
//  TRProject
//
//  Created by Tarena on 16/7/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "JKCenterModel.h"

@implementation JKCenterModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":[JKCenterDataModel class]};
}

@end
@implementation JKCenterDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"exhibitArtistList":[Exhibitartistlist class]};
}

@end


@implementation Exhibitartistlist
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id"};
}
@end


