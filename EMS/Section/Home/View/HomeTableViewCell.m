//
//  HomeTableViewCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/26.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.home_Pic];
        [self.contentView addSubview:self.title_LB];
        [self.contentView addSubview:self.content_LB];
        
        self.contentView.backgroundColor = APP_COLOR_BASE_HOME_BG;
        
        _weekSelf(weakSelf);
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView).with.offset(10);
            make.left.equalTo(weakSelf.contentView).with.offset(10);
            make.right.equalTo(weakSelf.contentView).with.offset(-10);
            make.height.mas_equalTo(@70);
        }];
        
        [_home_Pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_bgView.mas_top).with.offset(17);
            make.left.equalTo(_bgView.mas_left).with.offset(25);
            
//            make.bottom.equalTo(_bgView.mas_bottom).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
        [_title_LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_bgView.mas_top).with.offset(5);
            make.left.equalTo(_home_Pic.mas_right).with.offset(15);
            make.right.equalTo(_bgView.mas_right).with.offset(-8);
            make.height.mas_equalTo(@20);
        }];
        [_content_LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_title_LB.mas_bottom).with.offset(5);
            make.left.equalTo(_home_Pic.mas_right).with.offset(15);
            make.right.equalTo(_bgView.mas_right).with.offset(-8);
            make.height.mas_equalTo(@35);
        }];
        
        
    }
    return self;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        self.bgView = [[UIView new] initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _bgView.layer.shadowOffset = CGSizeMake(0, 3);
        _bgView.layer.shadowOpacity = 0.4;
        _bgView.layer.shadowRadius = 10;
    }
    return _bgView;
}

- (UIImageView *)home_Pic {
    if (_home_Pic == nil) {
        self.home_Pic = [[UIImageView new] initWithFrame:CGRectZero];
        _home_Pic.image = [UIImage imageNamed:@"placerholder"];
    }
    return _home_Pic;
}

- (UILabel *)title_LB {
    if (_title_LB == nil) {
        self.title_LB = [UILabel initUILabelWithFrame:CGRectZero
                                             withText:@"标题"
                                        withTextColor:[UIColor blackColor]
                                             withFont:SYSTEMFONT(14)
                                          withGbColor:[UIColor whiteColor]
                                    withTextAlignment:NSTextAlignmentLeft];
        
    }
    return _title_LB;
}

- (UILabel *)content_LB {
    if (_content_LB == nil) {
        self.content_LB = [UILabel initUILabelWithFrame:CGRectZero
                                               withText:@"这是内容"
                                          withTextColor:[UIColor grayColor]
                                               withFont:SYSTEMFONT(12)
                                            withGbColor:[UIColor whiteColor]
                                      withTextAlignment:NSTextAlignmentLeft];
    }
    return _content_LB;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
