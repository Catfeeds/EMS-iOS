//
//  LogVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "LogVC.h"
#import "DraggableButton.h"
#import "LogTabViewCell.h"

@interface LogVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *logTabView;
@property (nonatomic,assign) CGFloat oldContentOffset;
@property (nonatomic,strong) DraggableButton *avatar;
@property (nonatomic,assign) CGFloat measureHeight;
@property (nonatomic,strong) NSArray *arr;

@end

@implementation LogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationRightBar];
    [self initLogTabView];
    _oldContentOffset = _logTabView.contentOffset.y;
    
    [self initDS];
    
}

- (void) initDS {
    self.arr = @[@"1. EMS 基本信息模块开发与完善,主要是界面布局,图片资源整合,功能逻辑业务的处理.2. EMS 基本信息- 地区维护界面的开发. 主要任务,数据的展示,增加,删除,查看详情,上拉刷新.下拉加载等功能业务的处理.3. EMS 自定义组件SnackBarUtil,在项目中可以随处调用展示提示信息和警告信息等功能.4. EMS 封装了界面跳转类.修复了若干bug,更改了一些功能.",@"1. EMS 基本信息--密码区域 模块界面的设计与开发.2. EMS 基本信息--添加合作公司 模块界面的设计与开发.3. EMS 基本信息--权限维护 模块界面的设计与开发.4. EMS 系统,自定义了 地址选择器, 搜索框, 重写了地区分类算法.",@"EMS 基本信息- 地区维护界面的开发. 主要任务,数据的展示,增加,删除,查看详情,上拉刷新.下拉加载等功能业务的处理.3. EMS 自定义组件SnackBarUtil,在项目中可以随处调用展示提示信息和警告信息等功能",@"基本信息--添加合作公司 模块界面的设计与开发.3. EMS 基本信息--权限维护 模块界面的设计与开发.4. EMS 系统,自定义了 地址选择器, 搜索框, 重写了地区分类算法.",@"EMS 基本信息- 地区维护界面的发.",@"地区维护界面的发.",@"地区维护界面的发.地区维护界面的发.地区维护界面的发.地区维护界面的发.地区维护界面的发.",@"地区维护界面的发.",@"EMS 基本信息- 地区维护界面的发.",@"地区维护界面的发.",@"地区维护界面的发.地区维护界面的发.地区维护界面的发.",@"EMS 基本信息- 地区维护界面的发.",@"地区维护界面的发.",@"地区维护界面的发.地区维护界面的发.地区维护界面的发.",@"EMS 基本信息- 地区维护界面的发.",@"地区维护界面的发.",@"地区维护界面的发.地区维护界面的发.地区维护界面的发.",@"基本信息- 地区维护界面的开发. 主要任务,数据的展示,增加,删除,查看详情,上拉刷新.下拉加载等功能业务的处理.3. EMS 自定义组件SnackBarUtil,在项目中可以随处调用展示提示信息和警告信息等功能",@"组件SnackBarUtil,",@"组件SnackBarUtil,组件SnackBarUtil,组件SnackBarUtil,",@"组件SnackBarUtil,组件SnackBarUtil,",@"组件SnackBarUtil,组件SnackBarUtil,",@"数据的展示,增加,删除,查看详情,上拉刷新.",@"EMS 基本信息- 地区维护界面的发EMS 基本信息- 地区维护界面的发",@"EMS 基本信息- 地区维护界面的发EMS 基本信息- 地区维护界面的发EMS 基本信息- 地区维护界面的发",@"EMS 基本信息- 地区维护界面的发",@"EMS 基本信息- 地区维护界面的发.",@"地区维护界面的发.",@"地区维护界面的发.地区维护界面的发.地区维护界面的发."];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void) configurationRightBar {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //    [addBtn sizeToFit];
    addBtn.frame = VIEWFRAME(0, 0, 18, 18);
    [addBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:normal];
    [addBtn addTarget:self action:@selector(handleAddLog:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem new] initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem = rightBar;
}

- (void) handleAddLog:(UIBarButtonItem *) addlog {
    DebugLog(@"添加日志");
}


- (void) initLogTabView {
    self.logTabView = [[UITableView alloc] initWithFrame:VIEWFRAME(0, 10, SCREEN_WIDTH, SCREEN_HIGHT) style:(UITableViewStylePlain)];
    _logTabView.delegate = self;
    _logTabView.dataSource = self;
    _logTabView.separatorStyle = NO;
    [_logTabView registerClass:[LogTabViewCell class] forCellReuseIdentifier:@"LOGTAB"];
    _logTabView.backgroundColor = APP_COLOR_BASE_HOME_BG;
    [self.view addSubview:self.logTabView];
    
    _logTabView.rowHeight = UITableViewAutomaticDimension;
    _logTabView.estimatedRowHeight = 44;
    
    // 添加悬浮按钮
    [self loadAvatarInCustomView];
    
    // 添加刷新控件
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(handleNewData)];
    header.automaticallyChangeAlpha = YES;
    [header setTitle:@"开始刷新" forState:(MJRefreshStateIdle)];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
//    [header beginRefreshing];
    self.logTabView.mj_header =header;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(handleLoadMore)];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    
    self.logTabView.mj_footer = footer;
}

- (void)handleNewData {
    DebugLog(@"上啦刷新");
}
- (void)handleLoadMore {
    DebugLog(@"下拉加载");
}

- (void)loadAvatarInCustomView {
    self.avatar = [[DraggableButton alloc] initInView:self.view WithFrame:CGRectZero];
    [_avatar setBackgroundImage:[UIImage imageNamed:@"adds"] forState:UIControlStateNormal];
    [_avatar setAutoDocking:NO];
    
    _avatar.longPressBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  LongPress!!! ===");
        //More todo here.
        
    };
    
    _avatar.tapBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView ===  Tap!!! ===");
        //More todo here.
        
    };
    
    _avatar.draggingBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === Dragging!!! ===");
        //More todo here.
        
    };
    
    _avatar.dragDoneBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === DragDone!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDocking!!! ===");
        //More todo here.
        
    };
    
    _avatar.autoDockingDoneBlock = ^(DraggableButton *avatar) {
        NSLog(@"\n\tAvatar in customView === AutoDockingDone!!! ===");
        //More todo here.
        
    };
    
    _weekSelf(weakSelf);
    [_avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-30);
        make.right.equalTo(weakSelf.view.mas_right).offset(-30);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
}

#pragma mark - UITableview UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LogTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LOGTAB"];
//    cell.textLabel.text = @"测试";
    cell.workContentLB.text = [_arr objectAtIndex:indexPath.row];
    self.measureHeight = [cell measureCellHeightWithtext:[_arr objectAtIndex:indexPath.row]];
    
    // 点击事件
    _weekSelf(weakSelf);
    cell.clickForWorkCircleRaise = ^(LogTabViewCell *cell) {
        [weakSelf forRaised:cell];
    };
    return cell;
}

- (void)forRaised:(LogTabViewCell *) cell {
    DebugLog(@"点赞%@",cell.workContentLB.text);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    DebugLog(@"打印的高度%.2f",_measureHeight);
//    return _measureHeight;
//}

#pragma mark - UITableView UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



/**
 *滑动事件相关
 @param scrollView scrollView description
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > _oldContentOffset) {
//        DebugLog(@"向上滑动");
        _weekSelf(weakSelf);
        [_avatar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-30);
            make.right.equalTo(weakSelf.view.mas_right).offset(-30);
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }else{
//        DebugLog(@"向下滑动");
        _weekSelf(weakSelf);
        [_avatar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-30);
            make.right.equalTo(weakSelf.view.mas_right).offset(-30);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
}

/**
 * 控制标题的显示和隐藏
 @param scrollView scrollView description
 @param velocity velocity description
 @param targetContentOffset targetContentOffset description
 */
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if(velocity.y>0){
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
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
