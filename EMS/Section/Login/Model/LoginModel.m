//
//  LoginModel.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"username":@"usercode",
             @"password":@"userpassword",
             };
}


@end
