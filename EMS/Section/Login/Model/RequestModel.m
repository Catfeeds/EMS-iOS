//
//  RequestModel.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/25.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "RequestModel.h"

@implementation RequestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"status":@"status",
             @"msg":@"msg"
             };
}

@end
