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

- (NSString *)goToLoginModelWithCheck {
    if (!_username || _username.length <= 0) {
        return @"请输入用户名";
    }
    if (!_password || _password.length <= 0) {
        return @"请输入密码";
    }
    return nil;
}




@end
