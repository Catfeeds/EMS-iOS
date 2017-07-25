//
//  LoginModel.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy) NSString*username,*password;

- (NSString *)goToLoginModelWithCheck; // 登录输入检查

@end
