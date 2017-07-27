//
//  HomeTableViewCell.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/26.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMRippleShadowCell.h"

@interface HomeTableViewCell : XMRippleShadowCell

@property (nonatomic,strong) UIImageView *home_Pic;
@property (nonatomic,strong) UILabel *title_LB,*content_LB;
@property (nonatomic,strong) UIView *bgView;

@end
