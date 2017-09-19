//
//  CommonVC.m
//  EMS
//  通用功能模块 56个模块
//  Created by 上海梓钦 on 2017/8/15.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "CommonVC.h"
#import "ComCollectionCell.h"

@interface CommonVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *comArr;
@property (nonatomic,strong) NSArray *comPicArr;

@end

@implementation CommonVC

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
//         layout.minimumInteritemSpacing = 10;// 垂直方向的间距
//         layout.minimumLineSpacing = 10; // 水平方向的间距
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (NSArray *)comArr {
    if (_comArr == nil) {
        self.comArr = [[NSArray alloc] init];
    }
    return _comArr;
}

- (NSArray *)comPicArr {
    if (_comPicArr == nil) {
        self.comPicArr = [[NSArray alloc] init];
    }
    return _comPicArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationNavigation];
    [self initCollectionView];

}


/**
 * 配置导航头
 */
- (void)configurationNavigation{
    self.view.backgroundColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.title = _titleStr;
    [self initSwitchIDataSource];
}


/**
 * 初始化数据源
 */
- (void) initSwitchIDataSource {
    switch (_switchID) {
        case 0:
            _comArr = APP_BASE_INFO;
            _comPicArr = APP_BASE_INFO_PIC;
            break;
        case 1:
            _comArr = APP_WAIT_PEOPLE;
            _comPicArr = APP_WAIT_PEOPLE_PIC;
            break;
        case 2:
            _comArr = APP_INFO_COUNT;
            _comPicArr = APP_INFO_COUNT_PIC;
            break;
        case 3:
            _comArr = APP_SERVICE_FEE;
            _comPicArr = APP_SERVICE_FEE_PIC;
            break;
        case 4:
            _comArr = APP_WORK_INFO;
            _comPicArr = APP_WORK_INFO_PIC;
            break;
        case 5:
            _comArr = APP_CHECK_COUNT;
            _comPicArr = APP_CHECK_COUNT_PIC;
            break;
        case 6:
            _comArr = APP_TRAIN_MANAGER;
            _comPicArr = APP_TRAIN_MANAGER_PIC;
            break;
        case 7:
            _comArr = APP_TIME_JOB;
            _comPicArr=APP_TIME_JOB_PIC;
            break;
        case 8:
            _comArr = APP_EMPLOY_INFO;
            _comPicArr = APP_EMPLOY_INFO_PIC;
            break;
        default:
            break;
    }
}

/**
 * 配置CollectionView
 */
- (void)initCollectionView{
    _weekSelf(weakSelf);
    UIView *homeBG = [[UIView alloc] initWithFrame:CGRectZero];
    homeBG.backgroundColor = APP_COLOR_BASE_HOME_BG;
    [self.view addSubview:homeBG];
    [homeBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).offset(64);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.height.mas_equalTo(@15);
    }];
    [self.view addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(homeBG.mas_bottom).offset(0);
        make.right.equalTo(weakSelf.view.mas_right).offset(0);
        make.left.equalTo(weakSelf.view.mas_left).offset(0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(0);
    }];
    
    [self.collectionView registerClass:[ComCollectionCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    
}

#pragma mark -- collectionView dataSource 

/** 每组cell的个数*/
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _comArr.count;
}

/** cell的内容*/
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ComCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    [cell setValueForCellWithTxt:[_comArr objectAtIndex:indexPath.row] withPic:[UIImage imageNamed:[_comPicArr objectAtIndex:indexPath.row]]];
    return cell;
}

/** 总共多少组*/
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

/** 头部/底部*/
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        // 头部
//        WWCollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"header"   forIndexPath:indexPath];
//        view.headerLabel.text = [NSString stringWithFormat:@"头部 - %zd",indexPath.section];
//        return view;
//        
//    }else {
//        // 底部
//        WWCollectionFooterReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"footer"   forIndexPath:indexPath];
//        view.footerLabel.text = [NSString stringWithFormat:@"底部 - %zd",indexPath.section];
//        return view;
//    }
}

#pragma mark -- UICollectionViewDelegateFlowLayout
/** 每个cell的尺寸*/
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4);
}

///** 头部的尺寸*/
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    
//    
//    return CGSizeMake(self.view.bounds.size.width, 40);
//}
//
///** 顶部的尺寸*/
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    
//    
//    return CGSizeMake(self.view.bounds.size.width, 40);
//}

/** section的margin*/
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, 30, 15, 30);
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了第 %zd组 第%zd个",indexPath.section, indexPath.row);
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
