//
//  MyProfileController.m
//  DYNet
//
//  Created by MyMac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MyProfileController.h"
#import "LoginController.h"

@interface MyProfileController ()

@end

@implementation MyProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *user = @"";
    if ([user isEqualToString:@""]) {
        [self loginBtnClick];
    }
    
    
    self.view.backgroundColor = RGB(213, 213, 213);
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(20, 20, 100, 30);
    [self.view addSubview:loginBtn];
    
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)loginBtnClick{
    LoginController *login = [[LoginController alloc] init];
    login.title = @"登录";
    [self.navigationController pushViewController:login animated:YES];
    [self.navigationController hidesBottomBarWhenPushed];
}



@end
