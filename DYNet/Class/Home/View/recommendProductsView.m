//
//  recommendProductsView.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//  推荐商品模块

#import "recommendProductsView.h"
#import "HomeHeader.h"

@interface recommendProductsView ()

@property (nonatomic,strong) HomeHeader *homeHeader;

@property (nonatomic,strong) UIButton *proOne;
@property (nonatomic,strong) UIButton *proTwo;
@property (nonatomic,strong) UIButton *proThree;
@property (nonatomic,strong) UIButton *proFour;

@end

@implementation recommendProductsView

#pragma mark - 添加控件
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.homeHeader];
        [self addSubview:self.proOne];
        [self addSubview:self.proTwo];
        [self addSubview:self.proThree];
        [self addSubview:self.proFour];
    }
    return self;
}

#pragma mark - 设置控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.homeHeader.x = 0;
    self.homeHeader.y = 0;
    self.homeHeader.width = self.width;
    self.homeHeader.height = 48;
    
    self.proOne.x = 0;
    self.proOne.y = CGRectGetMaxY(self.homeHeader.frame) + 1;
    self.proOne.size = self.proOne.currentImage.size;
    
    self.proTwo.x = self.proOne.width + 1;
    self.proTwo.y = self.proOne.y;
    self.proTwo.size = self.proTwo.currentImage.size;
    
    self.proThree.x = 0;
    self.proThree.y = CGRectGetMaxY(self.proOne.frame) + 1;
    self.proThree.size = self.proThree.currentImage.size;
    
    self.proFour.x = self.proTwo.x;
    self.proFour.y = self.proThree.y;
    self.proFour.size = self.proFour.currentImage.size;
    
}

#pragma mark - getter And setter
- (HomeHeader *)homeHeader{
    if (!_homeHeader) {
        _homeHeader = [[HomeHeader alloc] initWithTitle:@"推荐商品" details:@"能让你变得更年轻"];
    }
    return _homeHeader;
}

- (UIButton *)proOne{
    if (!_proOne) {
        _proOne = [[UIButton alloc] init];
        [_proOne setImage:[UIImage imageNamed:@"proOne"] forState:UIControlStateNormal];
        _proOne.adjustsImageWhenHighlighted = NO;
    }
    return _proOne;
}

- (UIButton *)proTwo{
    if (!_proTwo) {
        _proTwo = [[UIButton alloc] init];
        [_proTwo setImage:[UIImage imageNamed:@"proTwo"] forState:UIControlStateNormal];
        _proTwo.adjustsImageWhenHighlighted = NO;
    }
    return _proTwo;
}

- (UIButton *)proThree{
    if (!_proThree) {
        _proThree = [[UIButton alloc] init];
        [_proThree setImage:[UIImage imageNamed:@"proThree"] forState:UIControlStateNormal];
        _proThree.adjustsImageWhenHighlighted = NO;
    }
    return _proThree;
}

- (UIButton *)proFour{
    if (!_proFour) {
        _proFour = [[UIButton alloc] init];
        [_proFour setImage:[UIImage imageNamed:@"proFour"] forState:UIControlStateNormal];
        _proFour.adjustsImageWhenHighlighted = NO;
    }
    return _proFour;
}

@end
