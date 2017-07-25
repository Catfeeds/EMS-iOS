//
//  NetRequestClient.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "NetRequestClient.h"

@interface NetRequestClient()

@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NetRequestClient

static NetRequestClient *_sharedNetAPIClient = nil;

#pragma mark - 初始化
// 单例
+ (instancetype)shareNetAPIClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetAPIClient = [[NetRequestClient alloc] initWithBaseUrl:[NSURL URLWithString:APP_BASE_URL]];
    });
    return _sharedNetAPIClient;
}

- (instancetype)initWithBaseUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.sessionManager = [[AFHTTPSessionManager new] initWithBaseURL:url];
        self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    }
    return self;
}


#pragma mark - real

- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(id)params
                 withMethedType:(NetwrkType)networktype
            autoShowProgressHUD:(BOOL)autoShowProgressHUD
                        success:(void (^)(id))successBlock
                        failure:(void (^)(id, NSError *))failureBlock{
    [self requestJsonDataWithPath:path withParams:params withMethedType:networktype autoShowProgressHUD:(BOOL)autoShowProgressHUD autoShowError:YES success:successBlock failure:failureBlock];
}

- (void)requestJsonDataWithPath:(NSString *)path
                     withParams:(id)params
                 withMethedType:(NetwrkType)networktype
            autoShowProgressHUD:(BOOL)autoShowProgressHUD
                  autoShowError:(BOOL)autoShowError
                        success:(void (^)(id))successBlock
                        failure:(void (^)(id, NSError *))failureBlock{
    if (!path || path.length <=0) {
        return;
    }
    if (autoShowProgressHUD) {
        // 显示加载狂
        DebugLog(@"菊花转");
        [NSObject showProgressHUD];
        
    }
    // 开始输出
    DebugLog(@"\n===========request===========\n%@\n%@:\n%@",kNetworkTypeName[networktype],path,params);
    if (!IsIOS7Later) {
        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }else{
        path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    }
    switch (networktype) {
        case NetwrkTyp_Get:
        {
            [self.sessionManager GET:path parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DebugLog(@"菊花灭");
                [NSObject dismissProgressHUD];
                DebugLog(@"\n===========response===========\n%@:\n%@",path,responseObject);
                // 开始判断JSON状态
                id error = [NSObject handleResponse:responseObject autoShowError:autoShowError];
                if (error) {
                    failureBlock(nil,error);
                }else{
                    successBlock(responseObject);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"菊花停");
                [NSObject dismissProgressHUD];
                DebugLog(@"\n===========response===========\n%@:\n%@", path, error);
                failureBlock(nil,error);
            }];
        }
        case NetwrkType_Post:
        {
            [self.sessionManager POST:path parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DebugLog(@"菊花灭");
                [NSObject dismissProgressHUD];
                DebugLog(@"\n===========response===========\n%@:\n%@",path,responseObject);
                // 开始判断JSON状态
                id error = [NSObject handleResponse:responseObject autoShowError:autoShowError];
                
                if (error) {
                    failureBlock(nil,error);
                }else{
                    successBlock(responseObject);
                }

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DebugLog(@"菊花停");
                [NSObject dismissProgressHUD];
                DebugLog(@"\n===========response===========\n%@:\n%@", path, error);
                [NSObject showError:error];
                failureBlock(nil,error);
            }];
        }
            break;
            
        default:
            break;
    }
    
    
}















@end
