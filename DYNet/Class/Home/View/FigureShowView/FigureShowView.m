//
//  FigureShowView.m
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "FigureShowView.h"
#import "FigureShowItem.h"
#import "HomeHeader.h"

@interface FigureShowView ()

@property (nonatomic,strong) FigureShowItem *figureShowItem;/**<*/
@property (nonatomic,strong) HomeHeader *homeHeader;
@end

@implementation FigureShowView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.homeHeader];
        
        [self addFigureShowItem];
    }
    return self;
}

- (void)addFigureShowItem{
    int totalloc = 2;
    CGFloat newedorsementPartW = 294 / 2;
    CGFloat newedorsementPartH = 292 / 2;
    CGFloat margin = (mainScreenW - totalloc * newedorsementPartW) / (totalloc + 1);
    for (int i = 0; i < 8; i ++) {
        int row = i / totalloc; //行号
        int loc = i % totalloc; //列号
        CGFloat newedorsementPartX = margin + (margin + newedorsementPartW) * loc;
        CGFloat newedorsementPartY = margin + (margin + newedorsementPartH) * row;
        self.figureShowItem = [[FigureShowItem alloc] initWithImage:@"person" name:@"黄海蓝" votes:@"9857"];
        self.figureShowItem.frame = CGRectMake(newedorsementPartX, newedorsementPartY + 45, newedorsementPartW, newedorsementPartH);
        [self addSubview:self.figureShowItem];
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
        _homeHeader = [[HomeHeader alloc] initWithTitle:@"我要秀" details:@"记录生活中的精彩"];
    }
    return _homeHeader;
}

@end
