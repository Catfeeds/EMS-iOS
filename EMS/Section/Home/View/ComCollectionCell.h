//
//  ComCollectionCell.h
//  EMS
//
//  Created by 上海梓钦 on 2017/8/16.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "XMRippleShadowCell.h"

@interface ComCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *comPic;
@property (nonatomic,strong) UILabel *comTxt;

- (void)setValueForCellWithTxt:(NSString*)txt withPic:(UIImage*)pic;

@end
