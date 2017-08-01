//
//  LogTabViewCell.h
//  EMS
//
//  Created by 上海梓钦 on 2017/8/1.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "XMRippleShadowCell.h"

@class LogTabViewCell;
typedef void (^ClickForWorkCircleRaise) (LogTabViewCell *cell);
@interface LogTabViewCell : XMRippleShadowCell
// 点赞block回调
@property (nonatomic,copy) ClickForWorkCircleRaise clickForWorkCircleRaise;

@property (nonatomic,strong) UIImageView *headPicIV;
@property (nonatomic,strong) UILabel *userNameLB,*workContentLB,*updateTimeLB,*raiseSumLB;
@property (nonatomic,strong) UIImageView *raiseBT,*commentBT;
@property (nonatomic,strong) UITableView *commentTV;

// 动态计算cell高度
- (CGFloat)measureCellHeightWithtext:(NSString *)text ;
@end
