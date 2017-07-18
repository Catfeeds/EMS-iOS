//
//  LaunchVC.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/18.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoverVC.h"
#import "TabBarVC.h"

@interface LaunchVC : UIViewController
@property(nonatomic,strong) CoverVC *coverVC;
@property(nonatomic,strong) TabBarVC *tabBarVC;
@end
