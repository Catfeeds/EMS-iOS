//
//  UITextField+Lazy.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/20.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Lazy)

+ (UITextField*)initWithTextFiledWithFrame:(CGRect)rect
                          withName:(NSString*)text
                   withPlaceholder:(NSString*)placeholder
                             withHintColor:(UIColor *)hintColor
                              withHintSize:(UIFont *)hintSize
                 withTextAlignment:(NSTextAlignment) textAlignment
                      withFontSize:(UIFont*)font
                     withTextColor:(UIColor*)textColor
                      withDelegate:(id) delegate;

@end
