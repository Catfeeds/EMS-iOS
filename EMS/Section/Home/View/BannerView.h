//
//  BannerView.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/25.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerView : UIView

@property (nonatomic, copy) void (^clickAction) (NSInteger curIndex) ;
@property (nonatomic, copy) NSArray *imageURLStrings;

- (instancetype)initWithFrame:(CGRect)frame scrollDuration:(NSTimeInterval)duration;
@end
