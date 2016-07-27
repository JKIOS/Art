//
//  NSObject+MJExtension.m
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}
+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return [self replaceKeyFromPropertyName];
}
+ (NSDictionary *)replaceKeyFromPropertyName{
    return nil;
}
@end
