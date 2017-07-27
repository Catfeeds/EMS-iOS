//
//  SettingTableViewCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/27.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.setPic];
        [self.contentView addSubview:self.goPic];
        [self.contentView addSubview:self.contextLB];
        
        UIView *line = [[UIView new] initWithFrame:CGRectZero];
        line.backgroundColor = APP_COLOR_BASE_HOME_BG;
        [self.contentView addSubview:line];
        
        _weekSelf(weakSelf);
        [_setPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(11.5);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(15);
            make.size.mas_offset(CGSizeMake(25, 25));
        }];
        [_contextLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(11);
            make.left.equalTo(_setPic.mas_right).offset(5);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-40);
            make.height.mas_offset(@28);
        }];
        [_goPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(14);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
            make.size.mas_offset(CGSizeMake(15, 15));

        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_bottom).offset(-1);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(15);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(0);
            make.height.mas_offset(@1);
        }];
        
    }
    return self;
}

- (UIImageView *)setPic {
    if (_setPic == nil) {
        self.setPic = [[UIImageView new] initWithFrame:CGRectZero];
    }
    return _setPic;
}

- (UIImageView *)goPic {
    if (_goPic == nil) {
        self.goPic = [[UIImageView new] initWithFrame:CGRectZero];
        _goPic.image = [UIImage imageNamed:@"go"];
    }
    return _goPic;
}

- (UILabel *)contextLB {
    if (_contextLB == nil) {
        self.contextLB = [UILabel initUILabelWithFrame:CGRectZero
                                              withText:@"测试数据"
                                         withTextColor:[UIColor blackColor]
                                              withFont:SYSTEMFONT(13)
                                           withGbColor:[UIColor whiteColor]
                                     withTextAlignment:NSTextAlignmentLeft];
    }
    return _contextLB;
}

@end
