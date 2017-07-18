//
//  CoverVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/18.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "CoverVC.h"
#import "POP.h"

@interface CoverVC ()

@property (nonatomic, strong) UIImageView *launchImageView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *titleImageView;

@property (nonatomic, strong) POPDecayAnimation *positionAnimation;
@property (nonatomic, strong) POPBasicAnimation *alphaAnimation;

@end

@implementation CoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCoverUI];
}


/**
 初始化启动界面的UI
 */
- (void)initCoverUI{
    
    self.launchImageView = [[UIImageView alloc] initWithFrame:APP_BOUNDS];
    self.launchImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.launchImageView];
    
    self.iconImageView = [[UIImageView alloc] initWithFrame:VIEWFRAME(0, 0, 100, 100)];
    self.iconImageView.center = self.view.center;
    self.iconImageView.image = [UIImage imageNamed:@"coverlog"];
    [self.launchImageView addSubview:self.iconImageView];
    [self initPositionAnimation];
    
    
    self.titleImageView = [[UIImageView alloc] initWithFrame:VIEWFRAME(0, 0, 120, 40)];
    self.titleImageView.center = CGPointMake(self.view.center.x, self.view.center.y - 40);
    self.titleImageView.image = [UIImage imageNamed:@""];
    self.titleImageView.alpha = 0;
    [self.view addSubview:self.titleImageView];
    //    [self initScaleAnimation];
    
//    UIImageView *imageView = [[UIImageView new] initWithImage:@""];
}

- (void)initPositionAnimation {
    self.positionAnimation = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    
    self.positionAnimation.velocity = @(- 250);
    self.positionAnimation.beginTime = CACurrentMediaTime() + 0.2;
    _weekSelf(weakSelf);
    [self.positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        [weakSelf initScaleAnimation];
    }];
    [self.iconImageView.layer pop_addAnimation:self.positionAnimation forKey:@"positionAnimation"];
}
- (void)initScaleAnimation {
    self.alphaAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    //    self.alphaAnimation.beginTime = CACurrentMediaTime() + 1.5;
    self.alphaAnimation.toValue = @(1);
    self.alphaAnimation.duration = 1;
    [self.titleImageView pop_addAnimation:self.alphaAnimation forKey:@"scaleAnimation"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
