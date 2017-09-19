//
//  ComCollectionCell.m
//  EMS
//
//  Created by 上海梓钦 on 2017/8/16.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "ComCollectionCell.h"

@implementation ComCollectionCell

- (void)setValueForCellWithTxt:(NSString *)txt withPic:(UIImage *)pic {
    _comPic.image = pic;
    _comTxt.text = txt;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.contentView.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.comPic];
        [self.contentView addSubview:self.comTxt];
        _weekSelf(weakSelf);
        [_comPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.contentView.mas_centerX).offset(0);
            make.centerY.equalTo(weakSelf.contentView.mas_centerY).offset(-15);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [_comTxt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_comPic.mas_bottom).offset(5);
            make.left.equalTo(weakSelf.contentView.mas_left).offset(0);
            make.right.equalTo(weakSelf.contentView.mas_right).offset(0);
            make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-5);
        }];
    }
    return self;
}



- (UIImageView *)comPic {
    if (_comPic == nil) {
        self.comPic = [[UIImageView alloc] initWithFrame:CGRectZero];
        _comPic.image = [UIImage imageNamed:@"placerholder"];
    }
    return _comPic;
}

- (UILabel *)comTxt {
    if (_comTxt == nil) {
        self.comTxt = [UILabel initUILabelWithFrame:CGRectZero
                                           withText:@"LABEL"
                                      withTextColor:[UIColor blackColor]
                                           withFont:SYSTEMFONT(13)
                                        withGbColor:[UIColor whiteColor]
                                  withTextAlignment:(NSTextAlignmentCenter)];
    }
    return _comTxt;
}


@end
