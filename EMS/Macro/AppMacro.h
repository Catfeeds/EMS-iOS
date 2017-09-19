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

#pragma mark - 文字相关

#define APP_BASE_INFO    @[@"地区维护",@"密码区域",@"添加合作公司",@"权限维护",@"用户组信息维护",@"用户绑定用户组",@"用户组绑定权限",@"账号数量设置",@"简历来源维护",@"基本参数维护",@"技术等级维护",@"技术方向维护",@"离职人员管理",@"物品管理",@"在线客服管理"]
#define APP_WAIT_PEOPLE  @[@"录入信息",@"查询信息",@"录入需求",@"需求查询",@"需求分配",@"简历需求查询",@"需求简历跟踪",@"在项人员详情",@"跟踪简历列表",@"用户微信管理",@"需求绑定"]
#define APP_INFO_COUNT   @[@"人员信息统计",@"员工绩效信息",@"需求统计",@"简历统计",@"需求发布统计"]
#define APP_SERVICE_FEE  @[@"服务费用核算",@"服务费用结算",@"审核",@"月服务费查询",@"利润查询"]
#define APP_WORK_INFO    @[@"工作任务",@"工作日志",@"反馈问题管理"]
#define APP_CHECK_COUNT  @[@"录入考勤信息",@"正确考勤信息",@"错误考勤信息",@"人员工资信息",@"物品借用管理"]
#define APP_TRAIN_MANAGER @[@"学校管理",@"企业管理"]
#define APP_TIME_JOB     @[@"需求列表",@"录入简历",@"查询需求简历"]
#define APP_EMPLOY_INFO  @[@"招聘学校管理",@"学校行程管理",@"代理人管理",@"普工项目管理",@"普工人员管理",@"普工统计",@"厂区负责人"]

#pragma mark - 图片相关
#define APP_BASE_INFO_PIC  @[@"region",@"pawregion",@"addcompany",@"authorfix",@"ruleengine_data",@"prophet_data",@"picfour",@"re_data",@"picone",@"sc_data",@"openad_data",@"odps_data",@"pictwo",@"ocr_data",@"imgone"];
#define APP_WAIT_PEOPLE_PIC  @[@"oaa",@"obb",@"odd",@"oee",@"occ",@"count_require",@"ojj",@"oii",@"omm",@"oll",@"ohh",@"okk"]
#define APP_INFO_COUNT_PIC   @[@"count_people_info",@"count_word_jixiao",@"count_require",@"count_word",@"count_release_require"]
#define APP_SERVICE_FEE_PIC  @[@"service_money",@"check_money",@"shenhe",@"chaxunsss",@"lirunsss"]
#define APP_WORK_INFO_PIC    @[@"work_work",@"work_log",@"work_question"]
#define APP_CHECK_COUNT_PIC  @[@"record_attendance_info",@"right_atten",@"wrong_info",@"salary_info",@"borrow_info"]
#define APP_TRAIN_MANAGER_PIC @[@"school_manager",@"company_manager"]
#define APP_TIME_JOB_PIC     @[@"time_part",@"work_release",@"chaxunsss"]
#define APP_EMPLOY_INFO_PIC  @[@"school_manager",@"travel",@"agent",@"count_require",@"userss",@"pt",@"managermain"]



#pragma mark - 接口相关

#define APP_IMAGE_URL  @"http://oot34wnx6.bkt.clouddn.com/"

#define APP_BASE_URL   @"http://192.168.1.104:8080"

#define APP_LOGIN_URL   @"/login/check.do"

#define APP_REGISTER_URL @"/login/enrollajax.do"





#endif /* AppMacro_h */
