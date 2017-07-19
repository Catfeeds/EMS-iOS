//
//  TabBarVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/18.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "TabBarVC.h"
#import "HomeVC.h"
#import "LogVC.h"
#import "ContactVC.h"
#import "MineVC.h"
#import "BaseNavigationVC.h"

@interface TabBarVC ()

@property(strong, nonatomic) HomeVC *homeVC;
@property(strong, nonatomic) LogVC *logVC;
@property(strong, nonatomic) ContactVC *contactVC;
@property(strong, nonatomic) MineVC *mineVC;

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTabBarController];
    [self initTabNavigation];
}


/**
 初始化TabBar
 */
- (void)initTabBarController {
    self.homeVC = [HomeVC new];
    self.logVC = [LogVC new];
    self.contactVC = [ContactVC new];
    self.mineVC = [MineVC new];
    _homeVC.title = @"上海梓钦信息技术有限公司";
    _logVC.title = @"工作日志";
    _contactVC.title = @"联系人";
    BaseNavigationVC *naviA = [[BaseNavigationVC new] initWithRootViewController:self.homeVC];
    BaseNavigationVC *naviB = [[BaseNavigationVC new] initWithRootViewController:self.logVC];
    BaseNavigationVC *naviC = [[BaseNavigationVC new] initWithRootViewController:self.contactVC];
    BaseNavigationVC *naviD = [[BaseNavigationVC new] initWithRootViewController:self.mineVC];
    self.viewControllers = @[naviA,naviB,naviC,naviD];
    self.selectedIndex = 0;
}

- (void) initTabNavigation {
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    UITabBarItem *tabBarItem         = [[UITabBarItem new] initWithTitle:@"应用" image:[UIImage imageNamed:@"first_unselect"] selectedImage:[UIImage imageNamed:@"first_select"] ];
    self.homeVC.tabBarItem           = tabBarItem;
    tabBarItem = [[UITabBarItem new] initWithTitle:@"日志" image:[UIImage imageNamed:@"second_unselect"] selectedImage:[UIImage imageNamed:@"second_select"]];
    self.logVC.tabBarItem = tabBarItem;
    
    tabBarItem = [[UITabBarItem new] initWithTitle:@"通讯录" image:[UIImage imageNamed:@"three_unselect"] selectedImage:[UIImage imageNamed:@"three_select"]];
    self.contactVC.tabBarItem = tabBarItem;
    
    tabBarItem = [[UITabBarItem new] initWithTitle:@"我的" image:[UIImage imageNamed:@"four_unselect"] selectedImage:[UIImage imageNamed:@"four_select"]];
    self.mineVC.tabBarItem = tabBarItem;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
