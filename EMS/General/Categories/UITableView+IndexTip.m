//
//  UITableView+IndexTip.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/31.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "UITableView+IndexTip.h"
#import <objc/runtime.h>
#import "Aspects.h"



@interface DZIndexTipManager : NSObject
@property (strong,nonatomic) UILabel * indexTipLabel;
@end
@implementation DZIndexTipManager

-(UILabel *)indexTipLabel{
    if(nil == _indexTipLabel){
        _indexTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        _indexTipLabel.layer.masksToBounds = YES;
        _indexTipLabel.layer.cornerRadius = 5;
        _indexTipLabel.backgroundColor = [UIColor colorWithRed:1/225.0 green:205/255.0 blue:206/255.0 alpha:1];
        _indexTipLabel.textAlignment = NSTextAlignmentCenter;
        _indexTipLabel.textColor = [UIColor whiteColor];
        _indexTipLabel.font = [UIFont systemFontOfSize:24];
    }
    return _indexTipLabel;
}


@end

@interface UITableView()

@property (strong,nonatomic) DZIndexTipManager * manager;

@end

@implementation UITableView (IndexTip)
#pragma mark - 运行时相关
static char DZIndexTipManagerKey;
-(void)setManager:(DZIndexTipManager *)manager{
    [self willChangeValueForKey:@"DZIndexTipManagerKey"];
    objc_setAssociatedObject(self, &DZIndexTipManagerKey,
                             manager,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"DZIndexTipManagerKey"];
}
-(DZIndexTipManager *)manager{
    return objc_getAssociatedObject(self, &DZIndexTipManagerKey);
}

-(void)addIndexTip{
    if(nil == self.manager){
        self.manager = [[DZIndexTipManager alloc] init];
    }
    NSObject * delegate = self.delegate;
    if(!delegate){
        NSException *excp = [NSException exceptionWithName:@"设置TableView代理delegate" reason:@"DZIndexTip >> 调用addIndexTip方法之前，UITableView 需要设置delegate" userInfo:nil];
        [excp raise]; // 抛出异常,提示错误
        
        return;
    }
    if(![delegate respondsToSelector:@selector(sectionIndexTitlesForTableView:)]){
        NSException *excp = [NSException exceptionWithName:@"实现TableView代理方法" reason:@"DZIndexTip >> UITableView delegate 需要实现方法sectionIndexTitlesForTableView:" userInfo:nil];
        [excp raise]; // 抛出异常,提示错误
        return;
    }
    if(![delegate respondsToSelector:@selector(tableView:sectionForSectionIndexTitle:atIndex:)]){
        NSException *excp = [NSException exceptionWithName:@"实现TableView代理方法" reason:@"DZIndexTip >> UITableView delegate 需要实现方法tableView:sectionForSectionIndexTitle:atIndex:" userInfo:nil];
        [excp raise]; // 抛出异常,提示错误
        return;
    }
    //拦截
    [delegate aspect_hookSelector:@selector(tableView:sectionForSectionIndexTitle:atIndex:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, UITableView *tableView,NSString *title,NSInteger index) {
        [self handleWithIndexTitle:title atIndex:index];
        return index;
    } error:NULL];
}
-(void)handleWithIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    //找出TableView的索引视图UITableViewIndex
    UIView * view = (UIView*)self.subviews.lastObject;
    if(![NSStringFromClass([view class]) isEqualToString:@"UITableViewIndex"]){
        for(UIView * sview in self.subviews){
            if([NSStringFromClass([sview class]) isEqualToString:@"UITableViewIndex"]){
                view = sview;
                break;
            }
        }
    }
    
    CGPoint center = CGPointZero;
    center.x = -(view.frame.origin.x)/2.0;
    center.y = view.frame.size.height/2.0;
    //添加索引提示视图到UITableViewIndex上
    self.manager.indexTipLabel.center = center;
    if(self.manager.indexTipLabel.superview != view){
        [view addSubview:self.manager.indexTipLabel];
    }
    //拦截TableView的索引视图UITableViewIndex的touches事件
    [view aspect_hookSelector:@selector(touchesBegan:withEvent:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, NSSet *touches,UIEvent *event) {
        self.manager.indexTipLabel.hidden = NO;
    } error:NULL];
    [view aspect_hookSelector:@selector(touchesMoved:withEvent:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, NSSet *touches,UIEvent *event) {
        self.manager.indexTipLabel.hidden = NO;
    } error:NULL];
    [view aspect_hookSelector:@selector(touchesEnded:withEvent:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, NSSet *touches,UIEvent *event) {
        self.manager.indexTipLabel.hidden = YES;
    } error:NULL];
    [view aspect_hookSelector:@selector(touchesCancelled:withEvent:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, NSSet *touches,UIEvent *event) {
        self.manager.indexTipLabel.hidden = YES;
    } error:NULL];
    
    self.manager.indexTipLabel.text = title;
}


@end
