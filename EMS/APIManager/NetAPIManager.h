//
//  NetAPIManager.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetRequestClient.h"
#pragma mark - 老子是接口
@interface NetAPIManager : NSObject

+ (instancetype)sharedManager;

// 通用接口
- (void)request_common_WithPath:(NSString *)aPath Params:(id)params succesBlack:(void (^)(id data))successBlock failue:(void (^)(id data,NSError *error))failueBlock;

- (void)request_common_WithPath:(NSString *)aPath Params:(id)params autoShowProgressHUD:(BOOL)autoShowProgressHUD succesBlack:(void (^)(id data))successBlock failue:(void (^)(id data,NSError *error))failueBlock;

// 登陆
- (void)request_Login_WithParams:(id)params successBlock:(void (^)(id data))successBlock failure:(void(^)(id data,NSError *error))failureBlock;

@end
