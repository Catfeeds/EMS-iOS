//
//  MineVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "MineVC.h"
#import "TipsTableViewCell.h"
#import "SettingTableViewCell.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIView *userInfoCard;
@property (nonatomic,strong) UIView *tipsReviewCard;
@property (nonatomic,strong) UITableView *tipsTabeView;
@property (nonatomic,strong) UITableView *sectionTableView;
@property (nonatomic,strong) UIImageView *mine_BG,*userPortialPic,*tipsMorePic;
@property (nonatomic,strong) UILabel *companyNameLB,*userNameLB,*userpartmentLB,*tipsNameLB;
@property (nonatomic,strong) UIView *headView;

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSArray *setDS;
@property (nonatomic,strong) NSArray *setPicDS;

@end

@implementation MineVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = APP_COLOR_BASE_HOME_BG;
    
    [self initHeaderView];
    
}


/**
 * 初始化Header
 */
- (void) initHeaderView {
    // 初始化头部View
    self.headView = [UIView new];
    _headView.frame = VIEWFRAME(0, 0, SCREEN_WIDTH, 310);
    _headView.backgroundColor = APP_COLOR_BASE_HOME_BG;
    // 背景图
    self.mine_BG = [UIImageView new];
    _mine_BG.frame = VIEWFRAME(0, 0, SCREEN_WIDTH, 300);
    [_mine_BG sd_setImageWithURL:[NSURL URLWithString:[APP_IMAGE_URL stringByAppendingString:@"apple.jpg"]] placeholderImage:[UIImage imageNamed:@"placerholder"]];
    [_headView addSubview:_mine_BG];
    // card1
    self.userInfoCard = [UIView new];
    _userInfoCard.frame = CGRectZero;
    _userInfoCard.backgroundColor = [UIColor colorWithWhite:1.f alpha:0.8];
    _userInfoCard.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _userInfoCard.layer.shadowOffset = CGSizeMake(0, 3);
    _userInfoCard.layer.shadowOpacity = 0.4;
    _userInfoCard.layer.shadowRadius = 10;
    [_mine_BG addSubview:_userInfoCard];
    // 头像
    self.userPortialPic = [UIImageView new];
    _userPortialPic.frame = CGRectZero;
    _userPortialPic.layer.masksToBounds = YES;
    _userPortialPic.layer.cornerRadius = 40.5;
    [_userPortialPic sd_setImageWithURL:[NSURL URLWithString:[APP_IMAGE_URL stringByAppendingString:@"pera.jpg"]] placeholderImage:[UIImage imageNamed:@"managermain"]];
    [_userInfoCard addSubview:_userPortialPic];
    
    // 公司名
    self.companyNameLB = [UILabel initUILabelWithFrame:CGRectZero
                                              withText:COMPANY_NAME
                                         withTextColor:[UIColor blackColor]
                                              withFont:BOLDSYSTEMFONT(16)
                                           withGbColor:[UIColor clearColor]
                                     withTextAlignment:NSTextAlignmentLeft];
    [_userInfoCard addSubview:_companyNameLB];
    // 用户名
    self.userNameLB = [UILabel initUILabelWithFrame:CGRectZero
                                           withText:@"测试用户名"
                                      withTextColor:[UIColor blackColor]
                                           withFont:BOLDSYSTEMFONT(16)
                                        withGbColor:[UIColor clearColor]
                                  withTextAlignment:NSTextAlignmentLeft];
    [_userInfoCard addSubview:_userNameLB];
    // 部门
    self.userpartmentLB = [UILabel initUILabelWithFrame:CGRectZero
                                               withText:@"技术部"
                                          withTextColor:[UIColor blackColor]
                                               withFont:BOLDSYSTEMFONT(16)
                                            withGbColor:[UIColor clearColor]
                                      withTextAlignment:NSTextAlignmentLeft];
    [_userInfoCard addSubview:_userpartmentLB];
    
    // 卡片二
    self.tipsReviewCard = [UIView new];
    _tipsReviewCard.frame = CGRectZero;
    _tipsReviewCard.backgroundColor = [UIColor colorWithWhite:1.f alpha:0.8];
    _tipsReviewCard.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _tipsReviewCard.layer.shadowOffset = CGSizeMake(0, 3);
    _tipsReviewCard.layer.shadowOpacity = 0.4;
    _tipsReviewCard.layer.shadowRadius = 10;
    [_mine_BG addSubview:_tipsReviewCard];
    // 待办事宜
    self.tipsNameLB = [UILabel initUILabelWithFrame:CGRectZero
                                           withText:@"待办事宜:"
                                      withTextColor:[UIColor blackColor]
                                           withFont:BOLDSYSTEMFONT(15)
                                        withGbColor:[UIColor clearColor]
                                  withTextAlignment:NSTextAlignmentLeft];
    [_tipsReviewCard addSubview:_tipsNameLB];
    // 更多
    self.tipsMorePic = [[UIImageView new] initWithFrame:CGRectZero];
    _tipsMorePic.image = [UIImage imageNamed:@"more_tips"];
    [_tipsReviewCard addSubview:_tipsMorePic];
    // tips的tableview
    // 模拟数据源
    self.dataSource = @[@"测试数据一",@"测试数据二",@"测试数据三",@"测试数据四"];
    
    self.tipsTabeView = [[UITableView new] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    _tipsTabeView.delegate = self;
    _tipsTabeView.dataSource = self;
    _tipsTabeView.separatorStyle = NO;
    _tipsTabeView.bounces = NO;
    _tipsTabeView.backgroundColor = [UIColor clearColor];
    [_tipsTabeView registerClass:[TipsTableViewCell class] forCellReuseIdentifier:@"tipsCell"];
    [_tipsReviewCard addSubview:_tipsTabeView];
    
    
    // 卡片一布局
    [_userInfoCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headView.mas_top).offset(35);
        make.left.equalTo(_headView.mas_left).offset(15);
        make.right.equalTo(_headView.mas_right).offset(-15);
        make.height.mas_equalTo(@100);
    }];
    [_userPortialPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userInfoCard.mas_top).offset(8);
        make.left.equalTo(_userInfoCard.mas_left).offset(8);
        make.size.mas_equalTo(CGSizeMake(81, 81));
    }];
    [_companyNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userInfoCard.mas_top).offset(6);
        make.left.equalTo(_userPortialPic.mas_right).offset(15);
        make.right.equalTo(_userInfoCard.mas_right).offset(-15);
        make.height.mas_equalTo(@25);
    }];
    [_userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_companyNameLB.mas_bottom).offset(6);
        make.left.equalTo(_userPortialPic.mas_right).offset(15);
        make.right.equalTo(_userInfoCard.mas_right).offset(-15);
        make.height.mas_equalTo(@25);
    }];
    [_userpartmentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userNameLB.mas_bottom).offset(6);
        make.left.equalTo(_userPortialPic.mas_right).offset(15);
        make.right.equalTo(_userInfoCard.mas_right).offset(-15);
        make.height.mas_equalTo(@25);
    }];
    
    // 卡片二布局
    [_tipsReviewCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userInfoCard.mas_bottom).offset(10);
        make.left.equalTo(_userInfoCard.mas_left).offset(0);
        make.right.equalTo(_userInfoCard.mas_right).offset(0);
        make.height.mas_equalTo(100);
    }];
    [_tipsNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tipsReviewCard.mas_top).offset(10);
        make.left.equalTo(_tipsReviewCard.mas_left).offset(10);
        make.width.mas_equalTo(@100);
    }];
    [_tipsMorePic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tipsReviewCard.mas_top).offset(10);
        make.right.equalTo(_tipsReviewCard.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_tipsTabeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tipsNameLB.mas_bottom).offset(8);
        make.left.equalTo(_tipsNameLB.mas_left).offset(8);
        make.right.equalTo(_tipsMorePic.mas_left).offset(0);
        make.bottom.equalTo(_tipsReviewCard.mas_bottom).offset(-8);
    }];
    
    // 初始化设置信息的TABLEVIEW
    // 模拟假数据
    self.setDS = @[@"个人信息",@"重置密码",@"清楚缓存",@"检查更新",@"关于我们",@"分享给好友",@"天气状况"];
    self.setPicDS = @[@"personal_info",@"change_psw",@"clear_data",@"check_update",@"about_us",@"share",@"weather"];
    
    self.sectionTableView = [[UITableView new] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    _sectionTableView.delegate = self;
    _sectionTableView.dataSource = self;
    _sectionTableView.separatorStyle = NO;
    _sectionTableView.bounces = NO;
    _sectionTableView.tableHeaderView = _headView;
    [_sectionTableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:@"settingCell"];
    [self.view addSubview:_sectionTableView];
    _weekSelf(weakSelf);
    [_sectionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(-20);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.size.mas_offset(CGSizeMake(SCREEN_WIDTH, SCREEN_HIGHT));
    }];
    
}


#pragma mark - UITableview UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:_sectionTableView]) {
        return _setDS.count;
    }else {
        return _dataSource.count>3 ? 3:_dataSource.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:_tipsTabeView]) {
        TipsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tipsCell"];
        cell.contextLB.text = [_dataSource objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else if([tableView isEqual:_sectionTableView]){
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
        cell.setPic.image = [UIImage imageNamed:[_setPicDS objectAtIndex:indexPath.row]];
        cell.contextLB.text = [_setDS objectAtIndex:indexPath.row];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_tipsTabeView]) {
        return 20;
    }else if([tableView isEqual:_sectionTableView]) {
        return 48;
    }
    return 0;
}

#pragma mark - UITableView UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
