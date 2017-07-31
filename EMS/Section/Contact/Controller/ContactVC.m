//
//  ContactVC.m
//  EMS
//
//  Created by 上海梓钦 on 2017/7/19.
//  Copyright © 2017年 上海梓钦. All rights reserved.
//

#import "ContactVC.h"
#import "TableViewIndexView.h"
#import "NSString+PinYin.h"
#import "ContactTabCell.h"

@interface ContactVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (strong,nonatomic) NSMutableArray * groupDataArray;
@property (strong,nonatomic) NSMutableArray * groupTitleArray;

@property (strong,nonatomic) TableViewIndexView * tableViewIndexView;

@end

@implementation ContactVC

-(NSMutableArray *)dataArray{
    if(nil == _dataArray){
        _dataArray = [[NSMutableArray alloc] init];
        NSArray *array = @[@"登记", @"大奔", @"周傅", @"爱德华",@"且污染费", @"啦文琪羊", @"文强", @"过段时间", @"等等", @"各个", @"宵夜", @"多少", @"贝尔",@" 而结婚", @"返回", @"你还", @"与非门", @"是的", @"模块", @"没做",@"俄文", @"咳嗽",@"fh",@"C罗",@"邓肯"];
        for (int i = 0; i<array.count; i++) {
            NSString *data = [array objectAtIndex:i];
            [data stringByReplacingOccurrencesOfString:@" " withString:@""];
            [_dataArray addObject:data];
        }
    }
    return _dataArray;
}
-(NSMutableArray *)groupDataArray{
    if(nil == _groupDataArray){
        _groupDataArray = [[NSMutableArray alloc] init];
    }
    return _groupDataArray;
}
-(NSMutableArray *)groupTitleArray{
    if(nil == _groupTitleArray){
        _groupTitleArray = [[NSMutableArray alloc] init];
    }
    return _groupTitleArray;
}


-(TableViewIndexView *)tableViewIndexView{
    if(nil == _tableViewIndexView){
        _tableViewIndexView = [TableViewIndexView loadFromXib];
        //索引视图设置
        _tableViewIndexView.tableView = self.myTableView;
        CGRect frame = _tableViewIndexView.frame;
        frame.origin.x = self.myTableView.frame.size.width - _tableViewIndexView.frame.size.width;
        frame.origin.y = self.myTableView.frame.origin.y + self.myTableView.contentInset.top;
        _tableViewIndexView.frame = frame;
        
        _tableViewIndexView.isShowTipView = YES;
        _tableViewIndexView.tipViewTitleFont = [UIFont systemFontOfSize:24];
        _tableViewIndexView.tipViewBackgroundColor = [UIColor darkGrayColor];
    }
    return _tableViewIndexView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self handleDataArray:self.dataArray GroupDataArray:self.groupDataArray GroupTitleArray:self.groupTitleArray];
    [self initTabView];
    
}

- (NSString *)transform:(NSString *)chinese
{
//    NSMutableString *pinyin = [chinese mutableCopy];
//    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
//    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    //NSLog(@"%@", pinyin);
    
    NSString *newStr = [chinese getFirstLetter];
    return newStr;
}
//按首字母分组
- (void)handleDataArray:(NSArray*)dataArray GroupDataArray:(NSMutableArray*)groupDataArray GroupTitleArray:(NSMutableArray*)groupTitleArray{
    
    NSMutableArray * groupCurrentDataArray = nil;
    NSString * lastFirstLetter = nil;
    NSString * currentFirstLetter = nil;
    dataArray = [dataArray sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        NSString * obj1FirstLetter = [[self transform:obj1] substringToIndex:1];
        NSString * obj2FirstLetter = [[self transform:obj2] substringToIndex:1];
        return [obj1FirstLetter compare:obj2FirstLetter];
    }];
    for(NSString * name in dataArray){
        currentFirstLetter = [[self transform:name] substringToIndex:1];
        if(![lastFirstLetter isEqualToString:currentFirstLetter]){
            groupCurrentDataArray = [[NSMutableArray alloc] init];
            [groupTitleArray addObject:currentFirstLetter];
            [groupDataArray addObject:groupCurrentDataArray];
        }
        [groupCurrentDataArray addObject:name];
        lastFirstLetter = currentFirstLetter;
    }
    if([[groupTitleArray firstObject] isEqualToString:@"#"]){
        id groupTile = [groupTitleArray firstObject];
        [groupTitleArray removeObject:groupTile];
        [groupTitleArray addObject:groupTile];
        
        id dataValue = [groupTitleArray firstObject];
        [groupTitleArray removeObject:dataValue];
        [groupTitleArray addObject:dataValue];
    }
}

- (void) initTabView {
    self.myTableView = [[UITableView  alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*2);
    self.myTableView.separatorStyle = NO;
    [self.view  addSubview:self.myTableView];
    self.myTableView.sectionIndexColor =[UIColor colorWithRed:0.10 green:0.68 blue:0.94 alpha:1.0];
    self.myTableView.sectionIndexBackgroundColor=[UIColor clearColor];
    [self.myTableView registerClass:[ContactTabCell class] forCellReuseIdentifier:@"reuseIdentifierNameCell"];
    
    
    
    //添加自定义索引视图
    [self.myTableView.superview addSubview:self.tableViewIndexView];
    [self.myTableView reloadData];
}

#pragma mark UITableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger count = self.groupTitleArray.count;
    return count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = [self.groupDataArray[section] count];
    return count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *name = self.groupDataArray[indexPath.section][indexPath.row];
    static NSString * reuseIdentifier = @"reuseIdentifierNameCell";
    ContactTabCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(nil == cell){
        cell = [[ContactTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
//        cell.textLabel.font = [UIFont systemFontOfSize:14];
//        cell.textLabel.textColor = [UIColor colorWithRed:105/255.0 green:105/255.0 blue:105/255.0 alpha:1];
        
    }
    cell.nameLB.text = name;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 62;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    label.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1];
    NSString * title = self.groupTitleArray[section];
    label.text = title;
    return label;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {
    return 20;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    //用自定义的索引视图
    [self.tableViewIndexView setIndexTitlesArray:self.groupTitleArray];
    return nil;
}



///**
// * 索引栏的数据源
// */
//- (void) initindexBarDS {
//    NSArray *dataSource = @[@"阿尔东方时尚",@"受到广泛的",@"给对方感到",@"第三方",@"发斯蒂芬",@"挂号费",@"*fersf",@"*sdag",@"sdfsb",@"bfdbhsfgh",@"沾上干",@"改变对方过后",@"阿尔东方时尚",@"受到广泛的",@"给对方感到",@"第三方",@"发斯蒂芬",@"挂号费",@"*fersf",@"*sdag",@"sdfsb",@"bfdbhsfgh",@"沾上干",@"改变对方过后"];
//    NSArray *indexArr= [dataSource arrayWithPinYinFirstLetterFormat];
//    self.indexDS = [NSMutableArray arrayWithArray:indexArr];
//    [self.contactTabView reloadData];
////    [self.contactTabView addIndexTip];
//}
//
//
///**
// * 初始化索引栏
// */
//- (void) initindexBarTabView {
//    self.contactTabView = [[UITableView alloc] initWithFrame:CGRectMake(0,20,SCREEN_WIDTH, SCREEN_HIGHT) style:(UITableViewStylePlain)];
//    self.contactTabView.delegate = self;
//    self.contactTabView.dataSource = self;
//    self.contactTabView.contentSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HIGHT*2);
//    [self.view addSubview:self.contactTabView];
//    self.contactTabView.sectionIndexColor = [UIColor blackColor];
//    self.contactTabView.sectionIndexBackgroundColor=[UIColor clearColor];
//    [self.contactTabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
//    
//    
//    [self squaireViewAction];
//    
//    
//    
//}
//
//- (void) squaireViewAction {
//    self.squaireView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HIGHT/2, 100, 100)];
//    _squaireView.backgroundColor = [UIColor orangeColor];
//    
//    if (self.isHidden) {
//        _squaireView.alpha = 0.f;
//    }else{
//        _squaireView.alpha = 1.f;
//        [_contactTabView addSubview:self.squaireView];
//    }
//
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    
//}
//
//#pragma mark--- UITableViewDataSource and UITableViewDelegate Methods---
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [self.indexDS count];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
////    if(section == 0)
////    {
////        return 1;
////    }else{
//        NSDictionary *dict = self.indexDS[section];
//        NSMutableArray *array = dict[@"content"];
//        return [array count];
////    }
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
//    NSDictionary *dict = self.indexDS[indexPath.section];
//    NSMutableArray *array = dict[@"content"];
//    cell.textLabel.text = array[indexPath.row];
//    cell.textLabel.textColor = [UIColor blackColor];
//    
//    return cell;
//}
//
//- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    //自定义Header标题
//    UIView* myView = [[UIView alloc] init];
//    myView.backgroundColor = APP_COLOR_BASE_HOME_BG;
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 22)];
//    titleLabel.textColor=[UIColor whiteColor];
//    
//    NSString *title = self.indexDS[section][@"firstLetter"];
//    titleLabel.text=title;
//    [myView  addSubview:titleLabel];
//    
//    return myView;
//}
//
//
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section    {
//    return 20;
//}
//
//
//
//
//
//#pragma mark---tableView索引相关设置----
////添加TableView头视图标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSDictionary *dict = self.indexDS[section];
//    NSString *title = dict[@"firstLetter"];
//    return title;
//}
//
//
////添加索引栏标题数组
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    NSMutableArray *resultArray =[NSMutableArray arrayWithCapacity:0];
//    for (NSDictionary *dict in self.indexDS) {
//        NSString *title = dict[@"firstLetter"];
//        [resultArray addObject:title];
//    }
//    return resultArray;
//}
//
//
////点击索引栏标题时执行
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    
//    
//    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
////    if ([title isEqualToString:UITableViewIndexSearch])
////    {
////        [tableView setContentOffset:CGPointZero animated:NO];//tabview移至顶部
////        return NSNotFound;
////    }
////    else
////    {
//    DebugLog(@"正在监听%ld",index);
//    
//    self.isHidden=NO;
//    [self squaireViewAction];
//    
//        return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index] ; // -1 添加了搜索标识
////    }
//    
//    
//}
////#pragma mark 自定义索引视图 回调处理，滚动到对应组
////-(void)tableViewSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
////    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
////    if(self.indexDS.count <= indexPath.row){
////        return;
////    }
////    if( 0 == indexPath.section){
////        CGPoint offset =  self.contactTabView.contentOffset;
////        offset.y = -self.contactTabView.contentInset.top;
////        self.contactTabView.contentOffset = offset;
////    }else{
////        [self.contactTabView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
////    }
////}
////-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
////    
////}
//
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/

@end
