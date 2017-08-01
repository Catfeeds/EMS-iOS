//
//  LogTabViewCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/8/1.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LogTabViewCell.h"

@interface LogTabViewCell()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LogTabViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headPicIV];
        [self.contentView addSubview:self.userNameLB];
        [self.contentView addSubview:self.workContentLB];
        [self.contentView addSubview:self.updateTimeLB];
        [self.contentView addSubview:self.raiseBT];
        [self.contentView addSubview:self.commentBT];
        [self.contentView addSubview:self.raiseSumLB];
//        [self.contentView addSubview:self.commentTV];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
        line.backgroundColor = APP_COLOR_BASE_HOME_BG;
        [self.contentView addSubview:line];
        // 头像
        _weekSelf(weakSelf);
        [_headPicIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(20);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(15);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        // USERNAME
        [_userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_headPicIV.mas_top).offset(0);
            make.left.equalTo(_headPicIV.mas_right).offset(10);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
            make.height.mas_equalTo(@30);
        }];
//        float y = [NSString heightForString:_workContentLB andWidth:SCREEN_WIDTH-80];
        float y =[NSString measureTextHeight:_workContentLB.text withFontSize:13 withWidth:SCREEN_WIDTH - 80];
        DebugLog(@"文档高度%.2f",y);
        // log
        [_workContentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_userNameLB.mas_bottom).offset(5);
            make.left.equalTo(_userNameLB.mas_left).offset(0);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
//            make.height.mas_equalTo(y);
//            make.bottom.equalTo(weakSelf.contentView).with.offset(0);
        }];
        // time
        [_updateTimeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_workContentLB.mas_bottom).offset(12);
            make.left.equalTo(_workContentLB.mas_left).offset(0);
            make.size.mas_equalTo(CGSizeMake(200, 30));
        }];
        // COMMENT
        [_commentBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_workContentLB.mas_bottom).offset(12);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
            make.size.mas_equalTo(CGSizeMake(16, 14));
        }];
        // raise
        [_raiseBT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_workContentLB.mas_bottom).offset(12);
            make.right.equalTo(_commentBT.mas_left).offset(-20);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        [_raiseSumLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_updateTimeLB.mas_bottom).offset(8);
            make.left.equalTo(_updateTimeLB.mas_left).offset(0);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
            
        }];
        
        // line
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_raiseSumLB.mas_bottom).offset(15);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(15);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(-15);
            // 最后一块控件必须添加这个约束才能实现cell的自适应.
            make.height.mas_equalTo(@0.5);
            make.bottom.equalTo(weakSelf.contentView).with.offset(-2);
        }];
        
        // 点赞
        _raiseBT.userInteractionEnabled = YES;
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleRaised)];
        [_raiseBT addGestureRecognizer:click];
        
        
        
    }
    return self;
}

- (void)handleRaised {
    DebugLog(@"");
    if (self.clickForWorkCircleRaise) {
        self.clickForWorkCircleRaise(self);
    }
}


- (UIImageView *)headPicIV {
    if (_headPicIV == nil) {
        self.headPicIV = [[UIImageView alloc] initWithFrame:CGRectZero];
        _headPicIV.image = [UIImage imageNamed:@"placerholder"];
    }
    return _headPicIV;
}

- (UILabel *)userNameLB {
    if (_userNameLB == nil) {
        self.userNameLB = [UILabel initUILabelWithFrame:CGRectZero
                                               withText:@"测试名字"
                                          withTextColor:[UIColor blackColor]
                                               withFont:SYSTEMFONT(14)
                                            withGbColor:[UIColor whiteColor]
                                      withTextAlignment:NSTextAlignmentLeft];
    }
    return _userNameLB;
}

- (UILabel *)workContentLB {
    if (_workContentLB == nil) {
        self.workContentLB = [UILabel initUILabelWithFrame:CGRectZero
                                                  withText:@"测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志测试工作日志"
                                             withTextColor:[UIColor blackColor]
                                                  withFont:SYSTEMFONT(13)
                                               withGbColor:[UIColor whiteColor]
                                         withTextAlignment:NSTextAlignmentLeft];
        _workContentLB.numberOfLines = 0;
        _workContentLB.backgroundColor = [UIColor whiteColor];
    }
    return _workContentLB;
}

- (UILabel *)updateTimeLB {
    if (_updateTimeLB == nil) {
        self.updateTimeLB = [UILabel initUILabelWithFrame:CGRectZero
                                                 withText:@"2017年8月1日"
                                            withTextColor:[UIColor grayColor]
                                                 withFont:SYSTEMFONT(12)
                                              withGbColor:[UIColor whiteColor]
                                        withTextAlignment:NSTextAlignmentLeft];
    }
    return _updateTimeLB;
}

- (UILabel *)raiseSumLB {
    if (_raiseSumLB == nil) {
        self.raiseSumLB = [UILabel initUILabelWithFrame:CGRectZero
                                               withText:@"点赞"
                                          withTextColor:APP_COLOR_BASE_NAV
                                            withGbColor:APP_COLOR_BASE_HOME_BG
                                      withTextAlignment:NSTextAlignmentLeft];
    }
    return _raiseSumLB;
}

- (UIImageView *)raiseBT {
    if (_raiseBT == nil) {
        self.raiseBT = [[UIImageView alloc] initWithFrame:CGRectZero];
        _raiseBT.image = [UIImage imageNamed:@"com_raise"];
    }
    return _raiseBT;
}

- (UIImageView *)commentBT {
    if (_commentBT == nil) {
        self.commentBT = [[UIImageView alloc] initWithFrame:CGRectZero];
        _commentBT.image = [UIImage imageNamed:@"com_comments"];
    }
    return _commentBT;
}

- (UITableView *)commentTV {
    if (_commentTV == nil) {
        self.commentTV = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _commentTV.delegate = self;
        _commentTV.dataSource = self;
        _commentTV.separatorStyle = NO;
        [_commentTV registerClass:[UITableView class] forCellReuseIdentifier:@"COMMON"];
    }
    return _commentTV;
}

- (CGFloat)measureCellHeightWithtext:(NSString *)text {
    return [NSString measureTextHeight:text withFontSize:13 withWidth:SCREEN_WIDTH - 80]+141;
}


#pragma mark - UITableview UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"COMMON"];
    cell.textLabel.text = @"测试";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - UITableView UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
