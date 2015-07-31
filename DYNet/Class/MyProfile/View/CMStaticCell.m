//
//  CMStaticCell.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "CMStaticCell.h"
#import "CMStaticCellItem.h"

@interface CMStaticCell ()

@property (nonatomic,strong) UIImageView *iconView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *arrowView;

@property (nonatomic,strong) UIView *separatorLine;

@end

@implementation CMStaticCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.arrowView];
        [self.contentView addSubview:self.separatorLine];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //设置数据
    _iconView.image = [UIImage imageNamed:self.staticCellItem.icon];
    _titleLabel.text = self.staticCellItem.title;
    _arrowView.hidden = !self.staticCellItem.showArrow;
    
    //设置frame
    CGFloat boundW = self.bounds.size.width;
    CGFloat boundH = self.bounds.size.height;
    CGFloat iconW = _iconView.image.size.width;
    CGFloat iconH = _iconView.image.size.height;
    CGFloat arrowW = _arrowView.image.size.width;
    CGFloat arrowH = _arrowView.image.size.height;
    
    _iconView.frame = CGRectMake(15, (boundH - iconH) / 2, iconW, iconH);
    _titleLabel.frame = CGRectMake(55, 0, 220, boundH);
    _arrowView.frame = CGRectMake(boundW - 15 - arrowW, (boundH - arrowH) / 2, arrowW, arrowH);
    _separatorLine.frame = CGRectMake(0, boundH - SINGLE_LINE_WIDTH, boundW, SINGLE_LINE_WIDTH);
    
}


#pragma mark - getter 和 setter
//初始化图标
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView  = [[UIImageView alloc] init];
    }
    return _iconView;
}

//初始化itemTitle
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    return _titleLabel;
}

//初始化右侧箭头
- (UIImageView *)arrowView{
    if (!_arrowView) {
        UIImageView *arrowView = [[UIImageView alloc] init];
        arrowView.image = [UIImage imageNamed:@"arrow_right"];
        _arrowView = arrowView;
    }
    return _arrowView;
}

//初始化底部横线
- (UIView *)separatorLine{
    if (!_separatorLine) {
        UIView *separatorLine = [[UIView alloc] init];
        separatorLine.backgroundColor = RGB(204, 204, 204);
        _separatorLine = separatorLine;
    }
    return _separatorLine;
}

@end
