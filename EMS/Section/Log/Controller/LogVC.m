//
//  LogVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LogVC.h"

@interface LogVC ()

@end

@implementation LogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationRightBar];
}

- (void) configurationRightBar {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [addBtn sizeToFit];
    addBtn.frame = VIEWFRAME(0, 0, 18, 18);
    [addBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:normal];
    [addBtn addTarget:self action:@selector(handleAddLog:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem new] initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void) handleAddLog:(UIBarButtonItem *) addlog {
    DebugLog(@"添加日志");
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
