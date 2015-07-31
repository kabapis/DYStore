//
//  MyProfileController.m
//  DYNet
//
//  Created by MyMac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MyProfileController.h"
#import "MyProfileHeader.h"
#import "fourParts.h"
#import "CMStaticCellItem.h"
#import "CMStaticCell.h"

@interface MyProfileController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIScrollView *myProfileScrollView;
@property (nonatomic,strong) MyProfileHeader *header;
@property (nonatomic,strong) fourParts *fourParts;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSMutableArray *itemArrayList;

@end

@implementation MyProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(213, 213, 213);
    [self.titleLabel setText:@"我的"];
    
    [self addViews];
    
    
    
    
    CMStaticCellItem *item00 = [CMStaticCellItem itemWithIcon:@"mineIcon1" title:@"我的消息" showArrow:YES];
    CMStaticCellItem *item01 = [CMStaticCellItem itemWithIcon:@"mineIcon2" title:@"个人资料" showArrow:YES];
    
    
    CMStaticCellItem *item10 = [CMStaticCellItem itemWithIcon:@"mineIcon3" title:@"我的代言人" showArrow:YES];
    CMStaticCellItem *item11 = [CMStaticCellItem itemWithIcon:@"mineIcon4" title:@"我的关注" showArrow:YES];
    CMStaticCellItem *item12 = [CMStaticCellItem itemWithIcon:@"mineIcon5" title:@"我的身材秀" showArrow:YES];
    
    
    CMStaticCellItem *item20 = [CMStaticCellItem itemWithIcon:@"mineIcon6" title:@"我的订单" showArrow:YES];
    CMStaticCellItem *item21 = [CMStaticCellItem itemWithIcon:@"mineIcon7" title:@"我的红包" showArrow:YES];
    
    self.itemArrayList = [NSMutableArray array];
    [self.itemArrayList addObject:@[item00,item01]];
    [self.itemArrayList addObject:@[item10, item11, item12]];
    [self.itemArrayList addObject:@[item20,item21]];
}

#pragma mark - UITableView dataSource and delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return self.itemArrayList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section >= 0 && section < self.itemArrayList.count) {
        NSArray *itemArray = self.itemArrayList[section];
        return itemArray.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    CMStaticCell *cell = (CMStaticCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CMStaticCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    if (indexPath.section >= 0 && indexPath.section < self.itemArrayList.count) {
        NSArray *itemArray = self.itemArrayList[indexPath.section];
        if (indexPath.row >= 0  && indexPath.row < itemArray.count) {
            cell.staticCellItem = itemArray[indexPath.row];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

#pragma mark - 计算frame
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.myProfileScrollView.x = 0;
    self.myProfileScrollView.y = 0;
    self.myProfileScrollView.width = mainScreenW;
    self.myProfileScrollView.height = mainScreenH - 64;
    
    self.header.x = 0;
    self.header.y = 0;
    self.header.width = mainScreenW;
    self.header.height = 112.5;
    
    self.fourParts.x = 0;
    self.fourParts.y = CGRectGetMaxY(self.header.frame);
    self.fourParts.width = mainScreenW;
    self.fourParts.height = 55;
    
    self.tableView.x = 0;
    self.tableView.y = CGRectGetMaxY(self.fourParts.frame);
    self.tableView.width = mainScreenW;
    self.tableView.height = 368;
    
    
    self.myProfileScrollView.contentSize = CGSizeMake(mainScreenW, CGRectGetMaxY(self.tableView.frame) + 64);
}

#pragma mark - 添加Views
- (void)addViews{
    [self.view addSubview:self.myProfileScrollView];
    [self.myProfileScrollView addSubview:self.header];
    [self.myProfileScrollView addSubview:self.fourParts];
    [self.myProfileScrollView addSubview:self.tableView];
}

#pragma mark - getter and setter
- (UIScrollView *)myProfileScrollView{
    if (!_myProfileScrollView) {
        _myProfileScrollView = [[UIScrollView alloc] init];
        _myProfileScrollView.backgroundColor = RGB(233, 233, 233);
        _myProfileScrollView.showsVerticalScrollIndicator = NO;
    }
    return _myProfileScrollView;
}

- (MyProfileHeader *)header{
    if (!_header) {
        _header = [[MyProfileHeader alloc] init];
    }
    return _header;
}

- (fourParts *)fourParts{
    if (!_fourParts) {
        _fourParts = [[fourParts alloc] init];
    }
    return _fourParts;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
