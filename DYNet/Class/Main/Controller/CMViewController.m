//
//  CMViewController.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "CMViewController.h"

#define kNaviStackMax  99

@interface CMViewController ()

@end

@implementation CMViewController

- (id)init
{
    if ((self = [super init])) {
        self.naviBackIndex = kNaviStackMax;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    _titleView = [[UIView alloc] init];
    _titleView.backgroundColor = [UIColor clearColor];
    _titleView.frame = CGRectMake(0, 0, 200, 44);
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.frame = CGRectMake(0, 0, 200, 44);
    _titleLabel.font = [UIFont fontWithSize:18.0f];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    [_titleView addSubview:_titleLabel];
    
    
    [self.navigationItem setTitle:nil];
    [self.navigationItem setTitleView:_titleView];
}

- (void)viewDidLayoutSubviews
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
        [super viewDidLayoutSubviews];
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        
    } else {
        
    }
}

- (void)_handleEndEditing
{
    [self.view endEditing:YES];
}

//页面返回事件
- (void)_handleViewBack
{
    if ([self.navigationController.viewControllers count] == 1) {
        [self dismissViewControllerAnimated:YES completion:^{ }];
        return;
    }
    
    UIViewController *viewController = [self viewControllerWithNaviIndex:self.naviBackIndex];
    if (viewController) {
        [self.navigationController popToViewController:viewController animated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

//从导航栏栈中获取UIViewController
- (UIViewController *)viewControllerWithNaviIndex:(int)naviIndex
{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (naviIndex < [viewControllers count] - 1) {
        return self.navigationController.viewControllers[naviIndex];
    }
    if ([viewControllers count] - 2 > 0) {
        return self.navigationController.viewControllers[[viewControllers count] - 2];
    }
    
    return nil;
}

#pragma mark - UIViewControllerRotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

@end
