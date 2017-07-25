//
//  NSObject+ProgressHUD.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/25.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ProgressHUD)

+ (NSString *)tipFromError:(NSError *)error;
+ (void)showError:(NSError *)error;
+ (void)showHudTipStr:(NSString*)tipStr;
+ (void)showSuccessHudTipStr:(NSString*)tipStr;
+ (void)showInfoHudTipStr:(NSString *)tipStr;
+ (void)showProgressHUD;
+ (void)dismissProgressHUD;

-(id)handleResponse:(id)responseJSON;
-(id)handleResponse:(id)responseJSON autoShowError:(BOOL)autoShowError;

@end
