//
//  NetRequestClient.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#define kNetworkTypeName @[@"Get",@"Post"]
// 网络请求类型
typedef NS_ENUM(NSInteger,NetwrkType) {
    NetwrkTyp_Get = 0, // GET请求
    NetwrkType_Post,    // POST请求
};
@interface NetRequestClient : NSObject

// 单例模式
+ (instancetype)shareNetAPIClient;


/**
 带自动提示错误的请求接口

 @param path 请求路径
 @param params 请求参数
 @param networktype 请求类型
 @param autoShowProgressHUD 是否需要转圈
 @param successBlock 成功回调Block
 @param failureBlock 失败回调Block
 */
- (void)requestJsonDataWithPath:(NSString*)path
                     withParams:(id)params
                 withMethedType:(NetwrkType)networktype
            autoShowProgressHUD:(BOOL)autoShowProgressHUD
                        success:(void(^)(id data))successBlock
                        failure:(void(^)(id data, NSError *error))failureBlock;


/**
 网络请求接口

 @param path 请求路径
 @param params 请求参数
 @param networktype 网络类型
 @param autoShowProgressHUD 是否菊花
 @param autoShowError 是否显示错误
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(id)params
                 withMethedType:(NetwrkType)networktype
            autoShowProgressHUD:(BOOL)autoShowProgressHUD
                  autoShowError:(BOOL)autoShowError
                        success:(void (^)(id))successBlock
                        failure:(void (^)(id, NSError *))failureBlock;



@end
