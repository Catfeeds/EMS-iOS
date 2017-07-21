//
//  AppMacro.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h


#define COMPANY_NAME                    @"上海梓钦信息技术有限公司"

#pragma mark - AppBaseColor
// 基本颜色
// 祖传蓝
#define APP_COLOR_BASE_NAV              [UIColor colorWithRed:78.0f/255.0f green:140.0f/255.0f blue:238.0f/255.0f alpha:1.00]
#define APP_COLOR_BASE_HOME_BG       [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1.00]
#define APP_COLOR_BASE_TABBAR           [UIColor colorWithRed:78.0f/255.0f green:140.0f/255.0f blue:238.0f/255.0f alpha:1.00]

// 祖传浅灰色背景
#define APP_COLOR_BASE_LINE_RED         [UIColor colorWithRed:0.70 green:0.21 blue:0.18 alpha:1.00]

#define APP_COLOR_BASE_LINE_BLUE        [UIColor colorWithRed:0.16 green:0.64 blue:0.99 alpha:1.00]

// 浅灰色
#define APP_COLOR_BASE_LINE_GRAY        [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.00]


// 按钮颜色
#define APP_COLOR_BASE_BUTTON_RED       [UIColor colorWithRed:0.70 green:0.21 blue:0.18 alpha:1.00]
#define APP_COLOR_BASE_BUTTON_BULE      [UIColor colorWithRed:0.00 green:0.47 blue:1.00 alpha:1.00]
#define APP_COLOR_BASE_Cell_LIGHTGRAY   [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00]
#define APP_COLOR_BASE_Section_GRAY     [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.00]


// 副标题文本颜色(深灰色)
#define APP_COLOR_BASE_SUBHEADING_GREY  [UIColor colorWithRed:0.55 green:0.55 blue:0.56 alpha:1.00]
#define APP_COLOR_BASE_LIGHT_GREY       [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.00]
// 灰色分类
#define APP_COLOR_BASE_Cell_DARK_GREY   HEXCOLOR(0x666666)
#define APP_COLOR_BASE_Cell_BACK_GREY   HEXCOLOR(0xefefef)
#define APP_COLOR_BASE_Cell_LIGHT_GREY  HEXCOLOR(0x999999)
#define APP_COLOR_BASE_Cell_LINE_GREY   HEXCOLOR(0xb2b2b2)

// 文字颜色
#define APP_COLOR_BASE_TEXT_RED         [UIColor colorWithRed:0.70 green:0.21 blue:0.18 alpha:1.00]
#define APP_COLOR_BASE_TEXT_GREY        HEXCOLOR(0x666666)


#pragma mark - 接口相关

#define APP_BASE_URL   @"http://192.168.0.101:8080"

#define APP_LOGIN_URL   @"/login/check.do"





#endif /* AppMacro_h */
