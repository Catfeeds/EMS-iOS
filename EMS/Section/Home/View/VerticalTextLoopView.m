//
//  VerticalTextLoopView.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/26.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "VerticalTextLoopView.h"
#define ScrollTime 1.f

@implementation VerticalTextLoopView

{
    UILabel * _scrollLabel;
    
    NSInteger _index;
    
    BOOL _needStop;
}

- (id)init{
    self = [super init];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        _needStop = NO;
        
        _textDataArr = @[@"您好"];
        _textFont    = [UIFont systemFontOfSize:14];
        _textColor   = [UIColor blackColor];
        _scrollLabel = nil;
        
        self.frame = CGRectMake(47, 0, [UIScreen mainScreen].bounds.size.width-96, 35);
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        _needStop = NO;
        
        _textDataArr = @[@"您好"];
        _textFont    = [UIFont systemFontOfSize:12];
        _textColor   = [UIColor blackColor];
        _scrollLabel = nil;
    }
    return self;
}

- (void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    _scrollLabel.font = textFont;
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _scrollLabel.textColor = textColor;
}


- (void)createScrollLabel{
    _scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    _scrollLabel.text          = @"公告";
    _scrollLabel.textAlignment = NSTextAlignmentLeft;
    _scrollLabel.textColor     = _textColor;
    _scrollLabel.font          = _textFont;
    [self addSubview:_scrollLabel];
}


- (void)startScrollBottomToTop{
    
    if (_scrollLabel == nil) {
        [self createScrollLabel];
    }
    
    _index = 0;
    _needStop = NO;
    [self scrollBottomToTop];
    
}

- (void)startScrollTopToBottom{
    
    if (_scrollLabel == nil) {
        [self createScrollLabel];
    }
    
    _index = 0;
    _needStop = NO;
    [self scrollTopToBottom];
    
}

- (void)stop{
    _needStop = YES;
}



- (void)scrollBottomToTop{
    
    if (![self isCurrentViewControllerVisible:[self viewController]]) {  // 处于非当前页面
        
        [self performSelector:@selector(scrollBottomToTop) withObject:nil afterDelay:ScrollTime*3];
        
    }else{                                                               // 处于当前页面
        
        if ([self.delegate respondsToSelector:@selector(verticalTextLoopView:currentTextIndex:)]) { // 代理回调
            [self.delegate verticalTextLoopView:self currentTextIndex:_index];
        }
        
        _scrollLabel.frame = CGRectMake(0, self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
        _scrollLabel.text  = _textDataArr[_index];
        
        
        [UIView animateWithDuration:ScrollTime animations:^{
            
            _scrollLabel.frame = CGRectMake(0, 0, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:ScrollTime delay:ScrollTime options:0 animations:^{
                
                _scrollLabel.frame = CGRectMake(0, -self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
                
            } completion:^(BOOL finished) {
                
                _index ++;
                if (_index == _textDataArr.count) {
                    _index = 0;
                }
                
                if (_needStop == NO) {
                    [self scrollBottomToTop];
                }
            }];
        }];
    }
}

- (void)scrollTopToBottom{
    
    if (![self isCurrentViewControllerVisible:[self viewController]]) { // 处于非当前页面
        
        [self performSelector:@selector(scrollTopToBottom) withObject:nil afterDelay:ScrollTime*2];
        
    }else{                                                              // 处于当前页面
        
        if ([self.delegate respondsToSelector:@selector(verticalTextLoopView:currentTextIndex:)]) { // 代理回调
            [self.delegate verticalTextLoopView:self currentTextIndex:_index];
        }
        
        _scrollLabel.frame = CGRectMake(0, -self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
        _scrollLabel.text  = _textDataArr[_index];
        
        
        
        [UIView animateWithDuration:ScrollTime animations:^{
            
            _scrollLabel.frame = CGRectMake(0, 0, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:ScrollTime delay:ScrollTime options:0 animations:^{
                
                _scrollLabel.frame = CGRectMake(0, self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
                
            } completion:^(BOOL finished) {
                
                _index ++;
                if (_index == _textDataArr.count) {
                    _index = 0;
                }
                
                if (_needStop == NO) {
                    [self scrollTopToBottom];
                }
            }];
        }];
    }
}


-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController{
    return (viewController.isViewLoaded && viewController.view.window);
}

- (UIViewController *)viewController {
    for (UIView * next = [self superview]; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


@end
