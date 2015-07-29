//
//  newEdorsementView.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "newEdorsementView.h"
#import "newEdorsementItem.h"
#import "HomeHeader.h"

@interface newEdorsementView ()

@property (nonatomic,strong) newEdorsementItem *newedorsementItem;

@property (nonatomic,strong) HomeHeader *homeHeader;

@end

@implementation newEdorsementView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.homeHeader];
        [self addNewedorsementItem];
    }
    return self;
}

- (void)addNewedorsementItem{
    int totalloc = 2;
    CGFloat newedorsementPartW = 294 / 2;
    CGFloat newedorsementPartH = 292 / 2;
    CGFloat margin = (mainScreenW - totalloc * newedorsementPartW) / (totalloc + 1);
    for (int i = 0; i < 4; i ++) {
        int row = i / totalloc; //行号
        int loc = i % totalloc; //列号
        CGFloat newedorsementPartX = margin + (margin + newedorsementPartW) * loc;
        CGFloat newedorsementPartY = margin + (margin + newedorsementPartH) * row;
        self.newedorsementItem = [[newEdorsementItem alloc] initWithImage:@"person" name:@"黄海蓝" votes:@"9857票"];
        self.newedorsementItem.frame = CGRectMake(newedorsementPartX, newedorsementPartY + 45, newedorsementPartW, newedorsementPartH);
        [self addSubview:self.newedorsementItem];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.homeHeader.x = 0;
    self.homeHeader.y = 0;
    self.homeHeader.width = self.width;
    self.homeHeader.height = 48;
}

#pragma mark - setter and getter
- (HomeHeader *)homeHeader{
    if (!_homeHeader) {
        _homeHeader = [[HomeHeader alloc] initWithTitle:@"最新代言人" details:@"每天更新,你也可以的"];
    }
    return _homeHeader;
}

@end
