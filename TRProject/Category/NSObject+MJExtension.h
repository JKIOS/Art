//
//  NSObject+MJExtension.h
//  Day08_Beauty
//
//  Created by tarena on 16/2/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface NSObject (MJExtension)
+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;
+ (NSDictionary *)replaceKeyFromPropertyName;
@end






