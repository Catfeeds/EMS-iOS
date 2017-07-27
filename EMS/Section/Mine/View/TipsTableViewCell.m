//
//  TipsTableViewCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/27.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "TipsTableViewCell.h"

@implementation TipsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.typeIV];
        [self.contentView addSubview:self.contextLB];
        self.contentView.backgroundColor = [UIColor clearColor];
        _contextLB.backgroundColor = [UIColor clearColor];
        
        _weekSelf(weakSelf);
        [_typeIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(0.5);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(15);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        [_contextLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.contentView.mas_top).offset(0);
            make.left.equalTo(_typeIV.mas_right).offset(5);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(-15);
            make.height.mas_equalTo(@16);
        }];
    }
    return self;
}

- (UIImageView *)typeIV {
    if (_typeIV == nil) {
        self.typeIV = [[UIImageView new] initWithFrame:CGRectZero];
        _typeIV.image = [UIImage imageNamed:@"point_blue"];
    }
    return _typeIV;
}

- (UILabel *)contextLB {
    if (_contextLB == nil) {
        self.contextLB = [UILabel initUILabelWithFrame:CGRectZero
                                              withText:@"测试数据"
                                         withTextColor:[UIColor blackColor]
                                              withFont:SYSTEMFONT(12)
                                           withGbColor:[UIColor whiteColor]
                                     withTextAlignment:NSTextAlignmentLeft];
    }
    return _contextLB;
}

@end
