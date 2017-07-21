//
//  LaunchVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/18.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LaunchVC.h"
#import "AppDelegate.h"
#import "POP.h"
#import "LoginVC.h"

@interface LaunchVC ()

@end

@implementation LaunchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    // 注意先后顺序
    [self initTabBarVC];
    [self initCoverVC];
}


/**
 * 初始化启动图
 */
- (void)initCoverVC {
    _coverVC = [CoverVC new];
    [_loginVC.view addSubview:_coverVC.view];
    POPBasicAnimation *removeCoverView = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    removeCoverView.beginTime = CACurrentMediaTime() + 4;
    removeCoverView.toValue = @0;
    removeCoverView.duration = 1;
    [_coverVC.view pop_addAnimation:removeCoverView forKey:@"removeCoverView"];
    [removeCoverView setCompletionBlock:^(POPAnimation *animation,BOOL finish){
        if (finish) {
            [_coverVC removeFromParentViewController];
            // 界面消失后判断网络状态
            if (!_coverVC.isBeingPresented) {
                [self checkNetWorking];
            }
        }
    }];
    
}
/**
 每次启动检查网络情况
 */
- (void)checkNetWorking {
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    //    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeFlat];
    [SVProgressHUD setRingThickness:4];
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [SVProgressHUD showInfoWithStatus:@"未知网络"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [SVProgressHUD showInfoWithStatus:@"请检查网络链接！"];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [SVProgressHUD showInfoWithStatus:@"已连接WIFI!"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [SVProgressHUD showInfoWithStatus:@"手机网络！"];
                break;
            default:
                break;
        }
    }];
//    [manager startMonitoring];
}

/**
 * 初始化TabBar
 */
- (void)initTabBarVC {
    // 将主视图指向Tabbar
//    _tabBarVC = [TabBarVC new];
    _loginVC  = [LoginVC new];
    UINavigationController *navi = [[UINavigationController new] initWithRootViewController:self.loginVC];
    AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appdelegate.window.rootViewController = navi;
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
