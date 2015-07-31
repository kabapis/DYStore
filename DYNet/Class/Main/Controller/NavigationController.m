//
//  NavigationController.m
//  weibo
//
//  Created by MyMac on 15/7/19.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "NavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface NavigationController ()

@end

@implementation NavigationController


+ (void)initialize{
    //设置整个项目的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15.0f];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15.0f];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.naviBarBackName = @"NavBar";
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupNavigationBar];
}

- (void)setNaviBarBackName:(NSString *)naviBarBackName{
    if (_naviBarBackName != naviBarBackName) {
        _naviBarBackName = [naviBarBackName copy];
        [self setupNavigationBar];
    }
}

- (void)setupNavigationBar{
    if (!self.naviBarBackName || ![self.naviBarBackName length]) return;
    
    UIImage *backgroundImage = [UIImage imageNamed:self.naviBarBackName];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSString *name = [NSString stringWithFormat:@"%@-64",self.naviBarBackName];
        backgroundImage = [UIImage imageNamed:name];
    }
    [self.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
//        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
//        // 设置左边的返回按钮
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backBtnClick) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
//        
//        // 设置右边的更多按钮
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(moreBtnClick) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)backBtnClick{
    [self popViewControllerAnimated:YES];
}

- (void)moreBtnClick{
    [self popToRootViewControllerAnimated:YES];
}

@end
