//
//  LoginVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LoginVC.h"
#import <AVFoundation/AVFoundation.h>
#import "RegisterVC.h"
#import "LoginModel.h"
#import "NetAPIManager.h"
@interface LoginVC ()<UINavigationControllerDelegate,RegisterVCDelegate>

// 播放背景视频
@property (nonatomic,strong) AVPlayer *player;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *userLabel;
@property (nonatomic,strong) UILabel *passwordLabel;
@property (nonatomic,strong) UITextField *userTF;
@property (nonatomic,strong) UITextField *passTF;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UILabel *registerNowLab;
@property (nonatomic,strong) UILabel *resetPawLab;
@property (nonatomic,strong) UIImageView *bgImageView;


@end

@implementation LoginVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVides) name:@"videGB" object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 防止无法播放的问题
    [self playVides];
    [self initVideoBG];
    [self initUserInfo];
    [self initLoginUI];
    
    
}


/**
 * 成功后保存密码
 */
- (void) saveUserInfo {
    DEFAULTS_SET_OBJ(_userTF.text, @"USERNAME");
    DEFAULTS_SET_OBJ(_passTF.text, @"PASSWORD");
    DEFAULTS_SAVE;
}
- (void) initUserInfo {
    NSString *userName =  DEFAULTS_GET_OBJ(@"USERNAME");
    NSString *passWord =  DEFAULTS_GET_OBJ(@"PASSWORD");
    _passTF.text = passWord;
    _userTF.text = userName;
}

#pragma mark --- 实现代理方法
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[self class]]) {
        [navigationController setNavigationBarHidden:YES animated:YES];
    }else {
        [navigationController setNavigationBarHidden:NO animated:YES];
    }
}

/**
 * 初始化视频登陆背景
 */
- (void) initVideoBG {
    [self setupForAVplayerView];
    //设置毛玻璃效果
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView *effectiView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    effectiView.alpha = 0.8f;
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2.0f];
//    effectiView.alpha = 0.3f;
//    [UIView commitAnimations];
//    effectiView.frame = self.view.bounds;
//    [self.view addSubview:effectiView];
}

/**
 初始化登陆界面
 */
- (void) initLoginUI {
    // 初始化标题
    UILabel *companyName = [UILabel initUILabelWithFrame:CGRectZero
                                                withText:COMPANY_NAME
                                           withTextColor:APP_COLOR_BASE_NAV
                                                withFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]
                                             withGbColor:[UIColor clearColor]
                                       withTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:companyName];
    _weekSelf(weakSelf);
    [companyName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.equalTo(weakSelf.view).with.offset(0);
        make.leftMargin.equalTo(weakSelf.view).with.offset(0);
        make.topMargin.equalTo(weakSelf.view).with.offset(140);
    }];
    
    // 初始化用户名
    UIView *userNameView = [[UIView new] initWithFrame:CGRectZero];
    userNameView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:userNameView];
    [userNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(companyName.mas_bottom).with.offset(90);
        make.right.equalTo(companyName.mas_right).with.offset(-30);
        make.left.equalTo(companyName.mas_left).with.offset(30);
        make.height.equalTo(@45);
    }];
    
    UIImageView *userNamePic = [[UIImageView new] initWithFrame:CGRectZero];
    userNamePic.image = [UIImage imageNamed:@"username"];
    [userNameView addSubview:userNamePic];
    self.userTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                             withName:@""
                                                      withPlaceholder:@"请输入用户名"
                                                        withHintColor:[UIColor whiteColor]
                                                         withHintSize:[UIFont systemFontOfSize:16]
                                                    withTextAlignment:NSTextAlignmentLeft
                                                         withFontSize:SYSTEMFONT(16)
                                                        withTextColor:[UIColor whiteColor]
                                                         withDelegate:self];
    [userNameView addSubview:_userTF];
    
    UIView *line = [[UIView new] initWithFrame:CGRectZero];
    line.backgroundColor = [UIColor whiteColor];
    [userNameView addSubview:line];
    
    [userNamePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userNameView.mas_left);
        make.right.equalTo(_userTF.mas_left).with.offset(-15);
        make.top.equalTo(userNameView).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userNameView.mas_top);
        make.left.equalTo(userNamePic.mas_right);
        make.right.equalTo(userNameView.mas_right);
        make.height.mas_equalTo(@44);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.equalTo(userNameView).with.offset(0);
        make.leftMargin.equalTo(userNameView).with.offset(0);
        make.top.equalTo(_userTF.mas_bottom);
        make.height.mas_equalTo(@1);
    }];
    
    // 初始化密码区域
    UIImageView *passwordPic = [[UIImageView new] initWithFrame:CGRectZero];
    passwordPic.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:passwordPic];
    self.passTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                 withName:@""
                                          withPlaceholder:@"请输入密码"
                                            withHintColor:[UIColor whiteColor]
                                             withHintSize:[UIFont systemFontOfSize:16]
                                        withTextAlignment:NSTextAlignmentLeft
                                             withFontSize:SYSTEMFONT(16)
                                            withTextColor:[UIColor whiteColor]
                                             withDelegate:self];
    _passTF.secureTextEntry = YES;
    [self.view addSubview:_passTF];
    UIView *line2 = [[UIView new] initWithFrame:CGRectZero];
    line2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:line2];
    
    [passwordPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line.mas_left);
        make.right.equalTo(_passTF.mas_left).with.offset(-15);
        make.top.equalTo(line).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_passTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line).with.offset(40);
        make.left.equalTo(passwordPic.mas_right);
        make.right.equalTo(line.mas_right);
        make.height.mas_equalTo(@44);
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.equalTo(line).with.offset(0);
        make.leftMargin.equalTo(line).with.offset(0);
        make.top.equalTo(_passTF.mas_bottom);
        make.height.mas_equalTo(@1);
    }];
    
    // 登陆按钮
    self.loginBtn = [UIButton initButtonWithButtonType:UIButtonTypeCustom
                                             withFrame:CGRectZero
                                             withTitle:@"立即登陆"
                                        withTitleColor:[UIColor whiteColor]
                                                withGB:APP_COLOR_BASE_NAV
                                              withFont:SYSTEMFONT(20)];
    ViewRadius(_loginBtn, 25);
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(line2.mas_bottom).with.offset(60);
        make.left.equalTo(line2.mas_left).with.offset(0);
        make.right.equalTo(line2.mas_right).with.offset(-0);
        make.height.equalTo(@50);
    }];
    
    // 立即注册和重置密码
    self.registerNowLab = [UILabel initUILabelWithFrame:CGRectZero
                                               withText:@"立即注册"
                                          withTextColor:APP_COLOR_BASE_NAV
                                               withFont:SYSTEMFONT(15)
                                            withGbColor:[UIColor clearColor]
                                      withTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:_registerNowLab];
    self.resetPawLab = [UILabel initUILabelWithFrame:CGRectZero
                                            withText:@"重置密码"
                                       withTextColor:[UIColor grayColor]
                                            withFont:SYSTEMFONT(15)
                                         withGbColor:[UIColor clearColor]
                                   withTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:_resetPawLab];
    
    [_registerNowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_loginBtn.mas_left);
        make.top.equalTo(_loginBtn.mas_bottom).with.offset(40);
    }];
    [_resetPawLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_loginBtn.mas_right);
        make.top.equalTo(_loginBtn.mas_bottom).with.offset(40);
    }];
    
    // 跳转事件
    [_loginBtn addTarget:self action:@selector(handleLogin:) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer new] initWithTarget:self action:@selector(handlerJump:)];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer new] initWithTarget:self action:@selector(handleReset:)];
    [_registerNowLab addGestureRecognizer:tap];
    [_resetPawLab addGestureRecognizer:tap1];
    _registerNowLab.userInteractionEnabled = YES;
    _resetPawLab.userInteractionEnabled = YES;
}

- (void) handleLogin: (UIButton *) login {
    DebugLog(@"登陆");
    LoginModel *loginModel = [[LoginModel new] init];
    loginModel.username = _userTF.text;
    loginModel.password = _passTF.text;
    
    [[NetAPIManager sharedManager] request_Login_WithParams:loginModel successBlock:^(id data) {
        DebugLog(@"成功!")
    } failure:^(id data, NSError *error) {
        DebugLog(@"失败!");
    }];
    
    
    
    
    [self saveUserInfo];
    
//    TabBarVC * tabBar = [TabBarVC new];
//    [self presentViewController:tabBar animated:YES completion:nil];
}

- (void) handlerJump:(UITapGestureRecognizer *)tap {
    DebugLog(@"跳转");
    RegisterVC *registerVC = [[RegisterVC alloc] init];
    registerVC.delegate = self;
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void) handleReset:(UITapGestureRecognizer *)tap {
    DebugLog(@"重置");
    [_userTF setText:@""];
    [_passTF setText:@""];
    [self saveUserInfo];
}


- (void)sendValueTypeString:(NSArray *)value {
    DebugLog(@"传递的用户名%@",value[0]);
    _userTF.text = value[0];
    _passTF.text = value[1];
    [self saveUserInfo];
    
    
}







/**
 * 播放器
 */
- (void) playVides {
    [self.player play];
}
- (void)setupForAVplayerView {
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = CGRectMake(-SCREEN_WIDTH*1.5, -SCREEN_HIGHT/2, SCREEN_WIDTH*4.2, SCREEN_HIGHT*2);
//    playerLayer.bounds =CGRectMake(-SCREEN_WIDTH*1.5, -SCREEN_HIGHT/2, SCREEN_WIDTH*4.5, SCREEN_HIGHT*1.8);
    [self.view.layer addSublayer:playerLayer];
}

/**
 *  初始化播放器
 */
- (AVPlayer *)player {
    if (!_player) {
        AVPlayerItem *playerItem = [self getPlayItem];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        //设置重复播放
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone; // set this
        //视频播放完发通知
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(__playerItemDidPlayToEndTimeNotification:)
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
        
    }
    return _player;
}

- (AVPlayerItem *)getPlayItem {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"videbg" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    return playerItem;
}

- (void)__playerItemDidPlayToEndTimeNotification:(NSNotification *)sender{
    [_player seekToTime:kCMTimeZero]; // 设置从头继续播放
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
