//
//  UITableView+IndexTip.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/31.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (IndexTip)
//显示索引字符悬浮提示;在点击或滑动索引时，在UITableView中间显示一个Label显示当前的索引字符
-(void)addIndexTip;
@end
