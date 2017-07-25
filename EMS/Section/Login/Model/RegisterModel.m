//
//  RegisterModel.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/25.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "RegisterModel.h"

@implementation RegisterModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userId":@"userId",
             @"userName":@"userName",
             @"password":@"password",
             @"fullName":@"fullName"
             };
}

- (NSString *)checkIsEmpty {
    if (!_userId || _userId.length<=0) {
        return @"请输入账号!";
    }
    if (!_userName || _userName.length <= 0) {
        return @"请输入昵称!";
    }
    if (!_fullName || _fullName.length <= 0) {
        return @"请输入真实姓名!";
    }
    if (!_password || _password.length <= 0) {
        return @"请输入密码";
    }
    return nil;
    
}

@end
