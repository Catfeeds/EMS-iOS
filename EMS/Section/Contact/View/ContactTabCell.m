//
//  ContactTabCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/31.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "ContactTabCell.h"

@implementation ContactTabCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.portailIV];
        [self.contentView addSubview:self.nameLB];
        
        UIView *line = [UIView new];
        line.frame = CGRectZero;
        line.backgroundColor = APP_COLOR_BASE_HOME_BG;
        [self.contentView addSubview:line];
        
        _weekSelf(weakSelf);
        [_portailIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(10);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(35);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(13);
            make.left.equalTo(weakSelf.portailIV.mas_right).offset(13);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(35);
            make.height.mas_equalTo(@35);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLB.mas_bottom).offset(9);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(0);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(0);
            make.height.equalTo(@1);
        }];
        
    }
    return self;
}

- (UIImageView *)portailIV {
    if (_portailIV == nil) {
        self.portailIV = [[UIImageView new] initWithFrame:CGRectZero];
        _portailIV.image = [UIImage imageNamed:@"placerholder"];
    }
    return _portailIV;
}

- (UILabel *)nameLB {
    if (_nameLB == nil) {
        self.nameLB = [UILabel initUILabelWithFrame:CGRectZero
                                           withText:@"测试"
                                      withTextColor:[UIColor blackColor]
                                           withFont:SYSTEMFONT(15)
                                        withGbColor:[UIColor whiteColor]
                                  withTextAlignment:NSTextAlignmentLeft];
    }
    return _nameLB;
}


@end
