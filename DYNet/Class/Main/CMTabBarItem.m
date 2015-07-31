//
//  CMTabBarItem.m
//  test
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "CMTabBarItem.h"

@implementation CMTabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        
        _font = [UIFont systemFontOfSize:15.0f];
        _titleColor = [UIColor blackColor];
        _titleColorSelected = [UIColor redColor];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = title;
        
        [self setNeedsLayout];
    }
}

- (void)setSelected:(BOOL)selected
{
    if (_selected != selected) {
        _selected = selected;
        
        [self setNeedsLayout];
    }
}

- (BOOL)isSelected
{
    return _selected;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat boundsW = self.bounds.size.width;
    CGFloat boundsH = self.bounds.size.height;
    
    titleLabel.text = _title;
    titleLabel.font = _font;
    titleLabel.frame = CGRectMake(0, 0, boundsW, boundsH);
    
    if (![self isSelected]) {
        titleLabel.textColor = _titleColor;
    } else {
        titleLabel.textColor = _titleColorSelected;
    }
}

@end
