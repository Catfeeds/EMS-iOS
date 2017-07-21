//
//  RegisterVC.h
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol RegisterVCDelegate <NSObject>

-(void)sendValueTypeString:(NSArray *)value;

@end

@interface RegisterVC : UIViewController

@property (nonatomic,assign) id<RegisterVCDelegate> delegate;

@end
