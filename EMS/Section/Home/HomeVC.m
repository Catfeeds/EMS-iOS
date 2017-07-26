//
//  HomeVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "HomeVC.h"
#import "VerticalTextLoopView.h"
#import "HomeTableViewCell.h"

@interface HomeVC ()<SDCycleScrollViewDelegate,VerticalTextLoopViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) SDCycleScrollView *sdcycleScrollView;
@property (nonatomic,strong) VerticalTextLoopView *verticalTextView;
@property (nonatomic,strong) UIView *cardView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *imageArr;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationNavigation];
}

- (void) configurationNavigation {
    self.view.backgroundColor = APP_COLOR_BASE_HOME_BG;
    self.scrollView = [[UIScrollView new] initWithFrame:VIEWFRAME(0, 0, SCREEN_WIDTH, SCREEN_HIGHT)];
//    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    [self initBanner];
    [self initNotifyMsg];
    [self initTableView];
}


/**
 * 初始化轮播图
 */
- (void) initBanner {
    NSArray *imageUrls = @[@"http://oot34wnx6.bkt.clouddn.com/apple.jpg",
                           @"http://oot34wnx6.bkt.clouddn.com/apples.jpg",
                           @"http://oot34wnx6.bkt.clouddn.com/iOS.png"];
    self.sdcycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:VIEWFRAME(0, 64, SCREEN_WIDTH, 250) delegate:self placeholderImage:[UIImage imageNamed:@"placerholder"]];
    _sdcycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _sdcycleScrollView.currentPageDotColor = APP_COLOR_BASE_NAV;
    _sdcycleScrollView.pageDotColor = [UIColor whiteColor];
    _sdcycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_sdcycleScrollView];
    _sdcycleScrollView.imageURLStringsGroup = imageUrls;
}


/**
 * 初始化通知栏
 */
- (void) initNotifyMsg {
    self.cardView = [[UIView new] initWithFrame:CGRectZero];
    _cardView.backgroundColor = [UIColor whiteColor];
    _cardView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _cardView.layer.shadowOffset = CGSizeMake(0, 3);
    _cardView.layer.shadowOpacity = 0.4;
    _cardView.layer.shadowRadius = 10;
    [self.view addSubview:_cardView];
    _weekSelf(weakSelf);
    UIImageView *notifyPic = [[UIImageView new] initWithFrame:CGRectZero];
    notifyPic.image = [UIImage imageNamed:@"notice"];
    [_cardView addSubview:notifyPic];
    
    UIView *line = [[UIView new] initWithFrame:CGRectZero];
    line.backgroundColor = [UIColor grayColor];
    [_cardView addSubview:line];
    
    self.verticalTextView = [[VerticalTextLoopView new] initWithFrame:CGRectZero];
    _verticalTextView.delegate = self;
    _verticalTextView.backgroundColor = [UIColor clearColor];
    _verticalTextView.textColor = [UIColor blackColor];
    _verticalTextView.textFont = [UIFont systemFontOfSize:14];
    _verticalTextView.textDataArr = @[@"今天下午公司组织大扫除,请各部门及时参与啊!",@"下午十一点公司全体开会,请务必到场!",@"6月19号放假通知!"];
    [_cardView addSubview:_verticalTextView];
    [_verticalTextView startScrollBottomToTop];
    
    UIView *zhanwei = [[UIView new] initWithFrame:CGRectZero];
    zhanwei.backgroundColor = [UIColor clearColor];
    [_cardView addSubview:zhanwei];
    
    UIImageView *go = [[UIImageView new] initWithFrame:CGRectZero];
    go.image = [UIImage imageNamed:@"go"];
    [_cardView addSubview:go];
    
    [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.sdcycleScrollView.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.view).with.offset(10);
        make.right.equalTo(weakSelf.view).with.offset(-10);
        make.height.mas_equalTo(@35);
    }];

    [notifyPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_top).with.offset(8);
        make.left.equalTo(_cardView.mas_left).with.offset(8);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_top).with.offset(10);
        make.left.equalTo(notifyPic.mas_right).with.offset(8);
        make.size.mas_equalTo(CGSizeMake(1, 15));
    }];
    [zhanwei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_top).with.offset(0);
        make.left.equalTo(line.mas_right).with.offset(0);
        make.right.equalTo(_cardView.mas_right).with.offset(-31);
        make.height.equalTo(@35);
    }];
    
//    [_verticalTextView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(cardView.mas_bottom).with.offset(0);
//        make.left.equalTo(line.mas_right).with.offset(8);
//        make.right.equalTo(go.mas_left).with.offset(-31);
////        make.height.mas_equalTo(@35);
//    }];
    [go mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_top).with.offset(10);
        make.left.equalTo(zhanwei.mas_right).with.offset(8);
//        make.right.equalTo(cardView.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
}


/**
 * 初始化tableview
 */
- (void) initTableView {
    self.titleArr = @[@"基本信息",@"待招人员",@"信息绩效统计",@"服务费核算",@"工作信息",@"考勤管理",@"培训",@"兼职信息",@"招聘管理"];
    
    self.imageArr = @[@"document",@"work",@"data",@"report",@"paper",@"check",@"customer",@"partment",@"tv"];
    
    self.tableView = [[UITableView new] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    _tableView.bounces = NO;
    _tableView.backgroundColor = [UIColor orangeColor];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"homeCell"];
    [self.view addSubview:_tableView];
    _weekSelf(weakSelf);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_bottom).with.offset(0);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(0);
        make.left.equalTo(weakSelf.view.mas_left).with.offset(0);
        make.height.mas_equalTo(SCREEN_HIGHT-250-43-64-44);
    }];
    
}

#pragma mark - UITableview UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
    cell.title_LB.text = [_titleArr objectAtIndex:indexPath.row];
    NSString *imgName = [_imageArr objectAtIndex:indexPath.row];
    cell.home_Pic.image = [UIImage imageNamed:imgName];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - UITableView UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - 轮播图代理

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    DebugLog(@"----点击了第%ld张",index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 通知栏代理

- (void)verticalTextLoopView:(VerticalTextLoopView *)verticalTextLoopView currentTextIndex:(NSInteger)index {
    DebugLog(@"----点击了%ld",index);
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
