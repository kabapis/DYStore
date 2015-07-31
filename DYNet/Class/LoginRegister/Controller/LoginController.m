//
//  LoginController.m
//  DYNet
//
//  Created by MyMac on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//  登录页面

#import "LoginController.h"
#import "NSString+Extension.h"

@interface LoginController ()

@property (nonatomic,strong) UIImageView *userNameBg;/**<手机号/账号背景*/
@property (nonatomic,strong) UIImageView *pwdBg;/**<密码背景*/
@property (nonatomic,strong) UITextField *userName;/**<手机号/账号输入框*/
@property (nonatomic,strong) UITextField *pwd;/**<密码输入框*/
@property (nonatomic,strong) UILabel *tip;/**<没有账号*/
@property (nonatomic,strong) UIButton *registerBtn;/**<立即注册*/
@property (nonatomic,strong) UIButton *forgetPwd;/**<忘记密码*/
@property (nonatomic,strong) UIButton *loginBtn;/**<登录按钮*/
@property (nonatomic,strong) UIButton *weixinLogin;/**<微信登录*/
@property (nonatomic,strong) UIView *firstline;/**<第一条横线*/
@property (nonatomic,strong) UIView *twoline;/**<第二条横线*/
@property (nonatomic,strong) UILabel *lineTitle;/**<横线中间的文字*/

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(238, 238, 238);
    [self.navigationItem setBackBarButtonItem:nil];
    [self.navigationItem setLeftBarButtonItem:[CommonUI navItem_Back:self action:@selector(back)]];
    [self.titleLabel setText:@"登录"];
    
    
    
    [self.view addSubview:self.userNameBg];
    [self.view addSubview:self.pwdBg];
    [self.view addSubview:self.userName];
    [self.view addSubview:self.pwd];
    [self.view addSubview:self.tip];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.forgetPwd];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.weixinLogin];
    [self.view addSubview:self.firstline];
    [self.view addSubview:self.twoline];
    [self.view addSubview:self.lineTitle];
    
}

- (void)registerBtnClick{
    DBLog(@"注册");
}

- (void)forgetPwdClick{
    DBLog(@"忘记密码");
}

- (void)loginBtnClick{
    DBLog(@"登录");
}

- (void)weixinLoginClick{
    DBLog(@"微信登录");
}

- (void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - 设置尺寸
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.userNameBg.size = self.userNameBg.image.size;
    self.userNameBg.x = (mainScreenW - self.userNameBg.width) * 0.5;
    self.userNameBg.y = 30;
    
    self.userName.x = self.userNameBg.x + 30;
    self.userName.y = self.userNameBg.y;
    self.userName.width = self.userNameBg.width - 30;
    self.userName.height = self.userNameBg.height;
    
    self.pwdBg.size = self.pwdBg.image.size;
    [self.pwdBg top:15 FromView:self.userNameBg];
    [self.pwdBg leftEqualToView:self.userNameBg];
    
    self.pwd.size = self.userName.size;
    [self.pwd topEqualToView:self.pwdBg];
    [self.pwd leftEqualToView:self.userName];
    
    [self.tip leftEqualToView:self.pwdBg];
    [self.tip top:8 FromView:self.pwdBg];
    self.tip.size = [self.tip.text sizeWithFont:[UIFont fontWithSize:12]];
    
    
    self.registerBtn.x = self.tip.x + self.tip.width;
    [self.registerBtn topEqualToView:self.tip];
    self.registerBtn.size = [self.registerBtn.titleLabel.text sizeWithFont:[UIFont fontWithSize:12]];

    self.forgetPwd.size = [self.forgetPwd.titleLabel.text sizeWithFont:[UIFont fontWithSize:12]];
    [self.forgetPwd topEqualToView:self.registerBtn];
    [self.forgetPwd rightEqualToView:self.pwdBg];
    
    self.loginBtn.size = self.loginBtn.currentImage.size;
    [self.loginBtn top:40 FromView:self.tip];
    self.loginBtn.x = (mainScreenW - self.loginBtn.width) * 0.5;
    
    self.lineTitle.size = [self.lineTitle.text sizeWithFont:[UIFont fontWithSize:12]];
    [self.lineTitle top:30 FromView:self.loginBtn];
    self.lineTitle.x = (mainScreenW - self.lineTitle.width) * 0.5;
    
    [self.firstline leftEqualToView:self.pwdBg];
    self.firstline.height = 1;
    self.firstline.y = self.lineTitle.y +  (self.lineTitle.height - self.firstline.height) * 0.5;
    self.firstline.width = self.lineTitle.x - self.pwdBg.x;
    
    self.twoline.size = self.firstline.size;
    self.twoline.x = self.lineTitle.x + self.lineTitle.width;
    self.twoline.y = self.firstline.y;
    
    self.weixinLogin.size = self.weixinLogin.currentImage.size;
    [self.weixinLogin top:10 FromView:self.lineTitle];
    self.weixinLogin.x = (mainScreenW - self.weixinLogin.width) * 0.5;
    
}


#pragma mark - getter and setter
/**<手机号/账号背景*/
- (UIImageView *)userNameBg{
    if (!_userNameBg) {
        _userNameBg = [[UIImageView alloc] init];
        _userNameBg.image = [UIImage imageNamed:@"loginBox"];
    }
    return _userNameBg;
}

/**<密码背景*/
- (UIImageView *)pwdBg{
    if (!_pwdBg) {
        _pwdBg = [[UIImageView alloc] init];
        _pwdBg.image = [UIImage imageNamed:@"pswBox"];
    }
    return _pwdBg;
}

/**<手机号/账号输入框*/
- (UITextField *)userName{
    if (!_userName) {
        _userName = [[UITextField alloc] init];
    }
    return _userName;
}

/**<密码输入框*/
- (UITextField *)pwd{
    if (!_pwd) {
        _pwd = [[UITextField alloc] init];
    }
    return _pwd;
}

/**<没有账号*/
- (UILabel *)tip{
    if (!_tip) {
        _tip = [[UILabel alloc] init];
        _tip.text = @"没有账号?";
        _tip.font = [UIFont fontWithSize:12];
        _tip.textColor = RGB(123, 123, 123);
    }
    return _tip;
}

/**<立即注册*/
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont fontWithSize:12];
        [_registerBtn setTitleColor:RGB(190, 151, 86) forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

/**<忘记密码*/
- (UIButton *)forgetPwd{
    if (!_forgetPwd) {
        _forgetPwd = [[UIButton alloc] init];
        [_forgetPwd setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _forgetPwd.titleLabel.font = [UIFont fontWithSize:12];
        [_forgetPwd setTitleColor:RGB(190, 151, 86) forState:UIControlStateNormal];
        [_forgetPwd addTarget:self action:@selector(forgetPwdClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPwd;
}

/**<登录按钮*/
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
        _loginBtn.adjustsImageWhenHighlighted = NO;
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

/**<微信登录*/
- (UIButton *)weixinLogin{
    if (!_weixinLogin) {
        _weixinLogin = [[UIButton alloc] init];
        [_weixinLogin setImage:[UIImage imageNamed:@"wechatBtn"] forState:UIControlStateNormal];
        _weixinLogin.adjustsImageWhenHighlighted = NO;
        [_weixinLogin addTarget:self action:@selector(weixinLoginClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _weixinLogin;
}


/**<第一条横线*/
- (UIView *)firstline{
    if (!_firstline) {
        _firstline = [[UIView alloc] init];
        _firstline.backgroundColor = RGB(204, 204, 204);
    }
    return _firstline;
}

/**<第二条横线*/
- (UIView *)twoline{
    if (!_twoline) {
        _twoline = [[UIView alloc] init];
        _twoline.backgroundColor = RGB(204, 204, 204);
    }
    return _twoline;
}

/**<横线中间的文字*/
- (UILabel *)lineTitle{
    if (!_lineTitle) {
        _lineTitle = [[UILabel alloc] init];
        _lineTitle.text = @"更多登录方式";
        _lineTitle.textColor = RGB(132, 132, 132);
        _lineTitle.font = [UIFont fontWithSize:12];
    }
    return _lineTitle;
}

@end
