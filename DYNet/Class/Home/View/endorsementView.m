//
//  endorsementView.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//  我要代言模块

#import "endorsementView.h"

@interface endorsementView ()

@property (nonatomic,strong) UIButton *endorsementBtn;/**<我要代言按钮*/
@property (nonatomic,strong) UIButton *raidersBtn;/**<代言攻略按钮*/
@property (nonatomic,strong) UIButton *votingRankBtn;/**<投票排行按钮*/
@property (nonatomic,strong) UIButton *productMallBtn;/**<产品商城按钮*/

@end

@implementation endorsementView

#pragma mark - 添加控件
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.endorsementBtn];
        [self addSubview:self.raidersBtn];
        [self addSubview:self.votingRankBtn];
        [self addSubview:self.productMallBtn];
    }
    return self;
}

#pragma mark - 设置控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.endorsementBtn.x = 0;
    self.endorsementBtn.y = 0;
    self.endorsementBtn.size = self.endorsementBtn.currentImage.size;
    
    self.raidersBtn.x = self.endorsementBtn.width + 1;
    self.raidersBtn.y = 0;
    self.raidersBtn.size = self.raidersBtn.currentImage.size;
    
    self.votingRankBtn.x = self.raidersBtn.x;
    self.votingRankBtn.y = self.raidersBtn.height + 1;
    self.votingRankBtn.size = self.votingRankBtn.currentImage.size;
    
    self.productMallBtn.x = self.votingRankBtn.x + self.votingRankBtn.width + 1;
    self.productMallBtn.y = self.votingRankBtn.y;
    self.productMallBtn.size = self.productMallBtn.currentImage.size;
}

#pragma mark - getter And setter
//我要代言按钮
- (UIButton *)endorsementBtn{
    if (!_endorsementBtn) {
        _endorsementBtn = [[UIButton alloc] init];
        [_endorsementBtn setImage:[UIImage imageNamed:@"endorsement"] forState:UIControlStateNormal];
        [_endorsementBtn setAdjustsImageWhenHighlighted:NO];
    }
    return _endorsementBtn;
}

//代言攻略
- (UIButton *)raidersBtn{
    if (!_raidersBtn) {
        _raidersBtn = [[UIButton alloc] init];
        [_raidersBtn setImage:[UIImage imageNamed:@"raiders"] forState:UIControlStateNormal];
        [_raidersBtn setAdjustsImageWhenHighlighted:NO];
    }
    return _raidersBtn;
}

//投票排行按钮
- (UIButton *)votingRankBtn{
    if (!_votingRankBtn) {
        _votingRankBtn = [[UIButton alloc] init];
        [_votingRankBtn setImage:[UIImage imageNamed:@"votingRank"] forState:UIControlStateNormal];
        [_votingRankBtn setAdjustsImageWhenHighlighted:NO];
    }
    return _votingRankBtn;
}

//产品商城按钮
- (UIButton *)productMallBtn{
    if (!_productMallBtn) {
        _productMallBtn = [[UIButton alloc] init];
        [_productMallBtn setImage:[UIImage imageNamed:@"productMall"] forState:UIControlStateNormal];
        [_productMallBtn setAdjustsImageWhenHighlighted:NO];
    }
    return _productMallBtn;
}

@end
