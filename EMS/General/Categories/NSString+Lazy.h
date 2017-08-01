//
//  NSString+Lazy.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/20.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Lazy)

+ (float) heightForString:(UILabel *)textView andWidth:(float)width;
// 动态计算文本宽度
+ (CGFloat)measureTextWidth:(NSString*)text
               withFontSize:(CGFloat)fontsize;
// 动态计算文本高度
+ (CGFloat)measureTextHeight:(NSString*)text
                withFontSize:(CGFloat)fontSize;
// 根据宽度计算高度
+ (CGFloat)measureTextHeight:(NSString *)text withFontSize:(CGFloat)fontSize withWidth:(CGFloat)width;

// 字典转json字符串
+ (NSString *) dictionaryToJsonString:(NSDictionary *) dict;
// 数组转json字符串
+ (NSString *) arrayToJsonString:(NSArray *) array;
// 判断字符串是否为纯浮点数
+ (BOOL) isPureFloat: (NSString*)string;
// 纯整数
+ (BOOL) isPureInterger: (NSString *)string;


@end
