//
//  HomeVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "HomeVC.h"
#import "BannerView.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationNavigation];
}

- (void) configurationNavigation {
    BannerView *banner = [[BannerView new] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250) scrollDuration:3.f];
    [self.view addSubview:banner];
    banner.imageURLStrings = @[@"http://oot34wnx6.bkt.clouddn.com/apple.jpg", @"http://oot34wnx6.bkt.clouddn.com/apples.jpg", @"http://oot34wnx6.bkt.clouddn.com/iOS.png"];
    banner.clickAction=^(NSInteger index) {
        DebugLog(@"点击了%ld",index);
    };
}


/**
 * 初始化轮播图
 */
- (void) initBanner {
    
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
