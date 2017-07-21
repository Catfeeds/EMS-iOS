//
//  NSString+Lazy.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/20.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "NSString+Lazy.h"

@implementation NSString (Lazy)

// measure Width
+ (CGFloat)measureTextWidth:(NSString *)text withFontSize:(CGFloat)fontsize {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]}
                                     context:nil];
    return rect.size.width;
}
// measure Height
+ (CGFloat)measureTextHeight:(NSString *)text withFontSize:(CGFloat)fontSize {
    CGRect rect = [text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSForegroundColorAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size.height;
}

+ (NSString *)dictionaryToJsonString:(NSDictionary *)dict {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&parseError];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *tempString = [NSMutableString stringWithString:jsonStr];
    NSString *attachString = [tempString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    return attachString;
}

+ (NSString *)arrayToJsonString:(NSArray *)array {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:&parseError];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableString *tempString = [NSMutableString stringWithString:jsonStr];
    NSString *attachString = [tempString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    return attachString;
}

// 判断字符串是否为纯浮点数
+ (BOOL)isPureFloat:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

// 纯整数
+ (BOOL)isPureInteger:(NSString*)string {
    NSScanner* scan = [NSScanner scannerWithString:string];
    NSInteger val;
    return[scan scanInteger:&val] && [scan isAtEnd];
}

@end
