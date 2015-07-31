//
//  MyProfileHeader.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MyProfileHeader.h"
#import "NSString+Extension.h"

@interface MyProfileHeader ()

@property (nonatomic,strong) UIImageView *mingBg;/**<背景*/
@property (nonatomic,strong) UIImageView *iconImg;/**<头像*/
@property (nonatomic,strong) UILabel *name;/**<昵称*/
@property (nonatomic,strong) UILabel *integration;/**<积分*/
@property (nonatomic,strong) UIImageView *slider;/**<进度条*/
@property (nonatomic,strong) UILabel *redBag;/**<红包*/
@property (nonatomic,strong) UILabel *signature;/**<个性签名*/

@end

@implementation MyProfileHeader

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.mingBg];
        [self addSubview:self.iconImg];
        [self addSubview:self.name];
        [self addSubview:self.integration];
        [self addSubview:self.slider];
        [self addSubview:self.redBag];
        [self addSubview:self.signature];
    }
    return self;
}

#pragma mark - 计算frame
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.mingBg.x = 0;
    self.mingBg.y = 0;
    self.mingBg.size = self.mingBg.image.size;
    
    self.iconImg.x = 11;
    self.iconImg.y = 8;
    self.iconImg.size = self.iconImg.image.size;
    
    [self.name top:1 FromView:self.iconImg];
    [self.name centerXEqualToView:self.iconImg];
    CGSize nameSize = [self.name.text sizeWithFont:self.name.font];
    self.name.width = nameSize.width;
    self.name.height = nameSize.height;

    [self.integration right:38 FromView:self.iconImg];
    self.integration.y = 25;
    CGSize integrationSize = [self.integration.text sizeWithFont:self.integration.font];
    self.integration.width = integrationSize.width;
    self.integration.height = integrationSize.height;
    
    [self.slider leftEqualToView:self.integration];
    [self.slider top:5 FromView:self.integration];
    self.slider.size = self.slider.image.size;
    
    [self.redBag leftEqualToView:self.slider];
    [self.redBag top:18 FromView:self.slider];
    CGSize redBagSize = [self.redBag.text sizeWithFont:self.redBag.font];
    self.redBag.width = redBagSize.width;
    self.redBag.height = redBagSize.height;
    
    [self.signature right:15 FromView:self.redBag];
    [self.signature topEqualToView:self.redBag];
    CGSize signatureSize = [self.signature.text sizeWithFont:self.signature.font];
    self.signature.width = signatureSize.width;
    self.signature.height = signatureSize.height;
    
//    [self.signature leftEqualToView:self.redBag];
//    [self.signature top:5 FromView:self.redBag];
//    CGSize signatureSize = [self.signature.text sizeWithFont:self.signature.font];
//    self.signature.width = signatureSize.width;
//    self.signature.height = signatureSize.height;
    

}

#pragma mark - getter and setter
/**<背景*/
- (UIImageView *)mingBg{
    if (!_mingBg) {
        _mingBg = [[UIImageView alloc] init];
        _mingBg.image = [UIImage imageNamed:@"mineBg"];
    }
    return _mingBg;
}

/**<头像*/
- (UIImageView *)iconImg{
    if (!_iconImg) {
        _iconImg = [[UIImageView alloc] init];
        _iconImg.image = [UIImage imageNamed:@"mineImg"];
    }
    return _iconImg;
}

/**<昵称*/
- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"小清新";
        _name.textAlignment = NSTextAlignmentCenter;
        _name.font = [UIFont fontWithSize:14.0f];
        _name.textColor = [UIColor whiteColor];
    }
    return _name;
}

/**<积分*/
- (UILabel *)integration{
    if (!_integration) {
        _integration = [[UILabel alloc] init];
        _integration.text = @"积分:157 / 280";
        _integration.textAlignment = NSTextAlignmentLeft;
        _integration.font = [UIFont fontWithSize:14.0f];
        _integration.textColor = [UIColor whiteColor];
    }
    return _integration;
}

/**<进度条*/
- (UIImageView *)slider{
    if (!_slider) {
        _slider = [[UIImageView alloc] init];
        _slider.image = [UIImage imageNamed:@"integration"];
    }
    return _slider;
}

/**<红包*/
- (UILabel *)redBag{
    if (!_redBag) {
        _redBag = [[UILabel alloc] init];
        _redBag.text = @"红包:￥899.00";
        _redBag.textAlignment = NSTextAlignmentLeft;
        _redBag.font = [UIFont fontWithSize:10.0f];
        _redBag.textColor = [UIColor whiteColor];
        
    }
    return _redBag;
}

/**<个性签名*/
- (UILabel *)signature{
    if (!_signature) {
        _signature = [[UILabel alloc] init];
        _signature = [[UILabel alloc] init];
        _signature.text = @"签名:我好累";
        _signature.textAlignment = NSTextAlignmentLeft;
        _signature.font = [UIFont fontWithSize:10.0f];
        _signature.textColor = [UIColor whiteColor];
    }
    return _signature;
}

@end
