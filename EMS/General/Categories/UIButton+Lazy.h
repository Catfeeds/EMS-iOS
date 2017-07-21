//
//  UIButton+Lazy.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/20.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Lazy)

+ (UIButton*)initButtonWithButtonType:(UIButtonType)buttonType
                            withFrame:(CGRect)frame
                            withTitle:(NSString*)title
                       withTitleColor:(UIColor*)titleColor;
+ (UIButton*)initButtonWithButtonType:(UIButtonType)buttonType
                           withFrame:(CGRect)frame
                           withTitle:(NSString *)title
                      withTitleColor:(UIColor *)titleColor
                              withGB:(UIColor*)GBColor;
+ (UIButton*)initButtonWithButtonType:(UIButtonType)buttonType
                           withFrame:(CGRect)frame
                           withTitle:(NSString *)title
                      withTitleColor:(UIColor *)titleColor
                               withGB:(UIColor*)GBColor
                             withFont:(UIFont*) font;

- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;
- (void)setItemImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;

@end
