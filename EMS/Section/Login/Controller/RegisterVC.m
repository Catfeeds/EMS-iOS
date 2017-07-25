//
//  RegisterVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/21.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "RegisterVC.h"
#import "RegisterModel.h"
#import "RequestModel.h"

@interface RegisterVC ()

@property (nonatomic,strong) UITextField *nickNameTF;
@property (nonatomic,strong) UITextField *realNameTF;
@property (nonatomic,strong) UITextField *userAccountTF;
@property (nonatomic,strong) UITextField *passwordTF;
@property (nonatomic,strong) UITextField *confirmPawTF;
@property (nonatomic,strong) UIButton *registerBtn;

@property (nonatomic,strong) RequestModel *requestModel;
//@property (nonatomic,strong) RegisterModel *registerModel;
@end

@implementation RegisterVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册账号";
    [self configurationRightBar];
    [self initUI];
}
- (void) configurationRightBar {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addBtn.frame = VIEWFRAME(0, 0, 18, 18);
    [addBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:normal];
    [addBtn addTarget:self action:@selector(handleAddLog:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem new] initWithCustomView:addBtn];
    self.navigationItem.leftBarButtonItem = rightBar;
}

- (void) handleAddLog:(UIBarButtonItem *) addlog {
    DebugLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) initUI {
    // 昵称
    UIImageView *nickNamePic = [[UIImageView new] initWithFrame:CGRectZero];
    nickNamePic.image = [UIImage imageNamed:@"nickname"];
    [self.view addSubview:nickNamePic];
    
    self.nickNameTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                     withName:@""
                                              withPlaceholder:@"请输入昵称"
                                                withHintColor:[UIColor grayColor]
                                                 withHintSize:[UIFont systemFontOfSize:16]
                                            withTextAlignment:NSTextAlignmentLeft
                                                 withFontSize:SYSTEMFONT(16)
                                                withTextColor:[UIColor grayColor]
                                                 withDelegate:self];
    [self.view addSubview:_nickNameTF];
    UIView *line1 = [[UIView new] initWithFrame:CGRectZero];
    line1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line1];
    _weekSelf(weakSelf);
    [nickNamePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).with.offset(140);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_nickNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).with.offset(130);
        make.left.equalTo(nickNamePic.mas_right).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@44);
    }];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nickNameTF.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@0.5);
    }];
    
    // realName
    UIImageView *realNamePic = [[UIImageView new] initWithFrame:CGRectZero];
    realNamePic.image = [UIImage imageNamed:@"managermain"];
    [self.view addSubview:realNamePic];
    
    self.realNameTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                     withName:@""
                                              withPlaceholder:@"请输入真实姓名"
                                                withHintColor:[UIColor grayColor]
                                                 withHintSize:[UIFont systemFontOfSize:16]
                                            withTextAlignment:NSTextAlignmentLeft
                                                 withFontSize:SYSTEMFONT(16)
                                                withTextColor:[UIColor grayColor]
                                                 withDelegate:self];
    [self.view addSubview:_realNameTF];
    UIView *line2 = [[UIView new] initWithFrame:CGRectZero];
    line2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line2];
    [realNamePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1).with.offset(50);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_realNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1).with.offset(40);
        make.left.equalTo(realNamePic.mas_right).with.offset(10);
        make.right.equalTo(line1).with.offset(-35);
        make.height.equalTo(@44);
    }];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_realNameTF.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@0.5);
    }];
    // 登陆账号
    UIImageView *accountPic = [[UIImageView new] initWithFrame:CGRectZero];
    accountPic.image = [UIImage imageNamed:@"account"];
    [self.view addSubview:accountPic];
    self.userAccountTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                     withName:@""
                                              withPlaceholder:@"请输入账号"
                                                withHintColor:[UIColor grayColor]
                                                 withHintSize:[UIFont systemFontOfSize:16]
                                            withTextAlignment:NSTextAlignmentLeft
                                                 withFontSize:SYSTEMFONT(16)
                                                withTextColor:[UIColor grayColor]
                                                 withDelegate:self];
    [self.view addSubview:_userAccountTF];
    UIView *line3 = [[UIView new] initWithFrame:CGRectZero];
    line3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line3];
    [accountPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2).with.offset(50);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_userAccountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2).with.offset(40);
        make.left.equalTo(realNamePic.mas_right).with.offset(10);
        make.right.equalTo(line2).with.offset(-35);
        make.height.equalTo(@44);
    }];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userAccountTF.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@0.5);
    }];
    // 密码
    UIImageView *passwordPic = [[UIImageView new] initWithFrame:CGRectZero];
    passwordPic.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:passwordPic];
    
    self.passwordTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                        withName:@""
                                                 withPlaceholder:@"请输入登陆密码"
                                                   withHintColor:[UIColor grayColor]
                                                    withHintSize:[UIFont systemFontOfSize:16]
                                               withTextAlignment:NSTextAlignmentLeft
                                                    withFontSize:SYSTEMFONT(16)
                                                   withTextColor:[UIColor grayColor]
                                                    withDelegate:self];
    [self.view addSubview:_passwordTF];
    UIView *line4 = [[UIView new] initWithFrame:CGRectZero];
    line4.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line4];
    [passwordPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line3).with.offset(50);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line3).with.offset(40);
        make.left.equalTo(passwordPic.mas_right).with.offset(10);
        make.right.equalTo(line3).with.offset(-35);
        make.height.equalTo(@44);
    }];
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passwordTF.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@0.5);
    }];

    // 确认密码
    UIImageView *confirmPawPic = [[UIImageView new] initWithFrame:CGRectZero];
    confirmPawPic.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:confirmPawPic];
    
    self.confirmPawTF = [UITextField initWithTextFiledWithFrame:CGRectZero
                                                        withName:@""
                                                 withPlaceholder:@"请再次输入密码"
                                                   withHintColor:[UIColor grayColor]
                                                    withHintSize:[UIFont systemFontOfSize:16]
                                               withTextAlignment:NSTextAlignmentLeft
                                                    withFontSize:SYSTEMFONT(16)
                                                   withTextColor:[UIColor grayColor]
                                                    withDelegate:self];
    [self.view addSubview:_confirmPawTF];
    UIView *line5 = [[UIView new] initWithFrame:CGRectZero];
    line5.backgroundColor = [UIColor grayColor];
    [self.view addSubview:line5];
    [confirmPawPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4).with.offset(50);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_confirmPawTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4).with.offset(40);
        make.left.equalTo(confirmPawPic.mas_right).with.offset(10);
        make.right.equalTo(line4).with.offset(-35);
        make.height.equalTo(@44);
    }];
    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_confirmPawTF.mas_bottom).with.offset(0);
        make.left.equalTo(weakSelf.view).with.offset(35);
        make.right.equalTo(weakSelf.view).with.offset(-35);
        make.height.equalTo(@0.5);
    }];
    _passwordTF.secureTextEntry = YES;
    _confirmPawTF.secureTextEntry = YES;
    
    // 立即注册
    self.registerBtn = [UIButton initButtonWithButtonType:UIButtonTypeCustom
                                             withFrame:CGRectZero
                                             withTitle:@"立即注册"
                                        withTitleColor:[UIColor whiteColor]
                                                withGB:APP_COLOR_BASE_NAV
                                              withFont:SYSTEMFONT(20)];
    ViewRadius(_registerBtn, 25);
    [self.view addSubview:_registerBtn];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(line5.mas_bottom).with.offset(60);
        make.left.equalTo(line5.mas_left).with.offset(0);
        make.right.equalTo(line5.mas_right).with.offset(-0);
        make.height.equalTo(@50);
    }];
    
    // 注册事件
    [_registerBtn addTarget:self action:@selector(handleRegister:) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)handleRegister:(UIButton *)sender {
    RegisterModel *registerM = [RegisterModel new];
    registerM.userId = _userAccountTF.text;
    registerM.userName = _nickNameTF.text;
    registerM.password = _passwordTF.text;
    registerM.fullName = _realNameTF.text;
    NSString *isEmpty = [registerM checkIsEmpty];
    if (isEmpty) {
        [NSObject showInfoHudTipStr:isEmpty];
        return;
    }
    if (_passwordTF.text != _confirmPawTF.text) {
        [NSObject showInfoHudTipStr:@"两次输入的密码不一致!"];
        return;
    }
    if ([_confirmPawTF.text  isEqual: @""]) {
        [NSObject showInfoHudTipStr:@"请输入确认密码!"];
        return;
    }
    NSDictionary *requestDict = [MTLJSONAdapter JSONDictionaryFromModel:registerM error:nil];
    DebugLog(@"传递的参数%@",registerM);
    [[NetAPIManager sharedManager] request_common_WithPath:APP_REGISTER_URL Params:requestDict autoShowProgressHUD:YES succesBlack:^(id data) {
        RequestModel *requestModel = [MTLJSONAdapter modelOfClass:[RequestModel class] fromJSONDictionary:data error:nil];
        if (requestModel.status == 0) {
            [NSObject showSuccessHudTipStr:requestModel.msg];
            NSArray *array = @[_userAccountTF.text,_passwordTF.text];
            if (self.delegate && [self.delegate respondsToSelector:@selector(sendValueTypeString:)]) {
                [self.delegate sendValueTypeString:array];
            }
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    } failue:^(id data, NSError *error) {
        
    }];
    DebugLog(@"注册");
}

- (void) handBack:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
