//
//  UILabel+Lazy.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Lazy)

+ (UILabel *) initUILabelWithFrame:(CGRect)frame
                          withText:(NSString *)text
                     withTextColor:(UIColor *)textColor
                          withFont:(UIFont *) font
                       withGbColor:(UIColor *)gbColor
                 withTextAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *) initUILabelWithFrame:(CGRect)frame
                          withText:(NSString *)text
                     withTextColor:(UIColor *)textColor
                       withGbColor:(UIColor *)gbColor
                 withTextAlignment:(NSTextAlignment)textAlignment;

@end
