//
//  NetAPIManager.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "NetAPIManager.h"
#import "LoginModel.h"
#import "RequestModel.h"
#import "BaseModel.h"

@implementation NetAPIManager

+ (instancetype)sharedManager {
    static NetAPIManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[self new] init];
    });
    return shareManager;
}

// 通用接口
- (void)request_common_WithPath:(NSString *)aPath Params:(id)params succesBlack:(void (^)(id data))successBlock failue:(void (^)(id data,NSError *error))failueBlock {
    
    [[NetRequestClient shareNetAPIClient] requestJsonDataWithPath:aPath withParams:params withMethedType:NetwrkType_Post autoShowProgressHUD:NO success:^(id data) {
        successBlock(data);
    } failure:^(id data, NSError *error) {
        failueBlock(data,error);
    }];
}

- (void)request_common_WithPath:(NSString *)aPath Params:(id)params autoShowProgressHUD:(BOOL)autoShowProgressHUD succesBlack:(void (^)(id data))successBlock failue:(void (^)(id data,NSError *error))failueBlock {
    
    [[NetRequestClient shareNetAPIClient] requestJsonDataWithPath:aPath withParams:params withMethedType:NetwrkType_Post autoShowProgressHUD:(BOOL)autoShowProgressHUD success:^(id data) {
        successBlock(data);
    } failure:^(id data, NSError *error) {
        failueBlock(data,error);
    }];
}
// login
- (void)request_Login_WithParams:(id)params successBlock:(void (^)(id))successBlock failure:(void (^)(id, NSError *))failureBlock {
    NSDictionary *requestDict = [MTLJSONAdapter JSONDictionaryFromModel:params error:nil];
    NSString *pathStr = APP_LOGIN_URL;
    [[NetRequestClient shareNetAPIClient] requestJsonDataWithPath:pathStr withParams:requestDict withMethedType:NetwrkType_Post autoShowProgressHUD:YES success:^(id data) {
        RequestModel *loginModel = [MTLJSONAdapter modelOfClass:[RequestModel class] fromJSONDictionary:data error:nil];
        DebugLog(@"登陆的JSON--:%@",loginModel);
        successBlock(loginModel);
    } failure:^(id data, NSError *error) {
        DebugLog(@"登陆出错!");
    }];
}
- (void)request_register_WithParams:(id)params successBlock:(void (^)(id))successBlock failure:(void (^)(id, NSError *))failureBlock {
    
}
















@end
