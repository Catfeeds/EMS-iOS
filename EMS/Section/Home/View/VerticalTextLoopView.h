//
//  VerticalTextLoopView.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/26.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VerticalTextLoopView;

@protocol VerticalTextLoopViewDelegate <NSObject>

@optional
- (void) verticalTextLoopView:(VerticalTextLoopView *) verticalTextLoopView currentTextIndex: (NSInteger)index;

@end

@interface VerticalTextLoopView : UIView

@property (nonatomic,assign) id <VerticalTextLoopViewDelegate>delegate;

@property (nonatomic,copy)   NSArray * textDataArr;
@property (nonatomic,copy)   UIFont  * textFont;
@property (nonatomic,copy)   UIColor * textColor;

- (void)startScrollBottomToTop;
- (void)startScrollTopToBottom;

- (void)stop;


@end
