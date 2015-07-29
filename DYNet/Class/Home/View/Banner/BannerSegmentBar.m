//
//  BannerSegmentBar.m
//  DYNet
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "BannerSegmentBar.h"

@interface BannerSegmentBar ()
{
    CGFloat count;
    UIColor * backColor;
    CGFloat segmentHeight;
}
@property (nonatomic ,strong) UIView * segment;
@end

@implementation BannerSegmentBar

-(instancetype)init
{
    if (self==[super init]) {
        //init code
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        //init code
    }
    return self;
}

-(instancetype)createBannerSegmentBarWithImageCount:(CGFloat)imgCount AndSegmentBackgroundColor:(UIColor *)color ViewX:(CGFloat)x ViewY:(CGFloat)Y ViewHeight:(CGFloat)height
{
    if (self==[super initWithFrame:CGRectMake(x, Y, mainScreenW, height)]) {
        count = imgCount;
        backColor = color;
        segmentHeight = height;
        
        [self createUI];
    }
    
    return self;
}

-(void)createUI
{
    _segment = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/count, segmentHeight)];
    _segment.backgroundColor = backColor;
    [self addSubview:_segment];
}

#pragma mark transform the frame

-(void)changeBannerSegmentFrameWithIndex:(NSInteger)index
{
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        CGRect rect;
        rect = _segment.frame;
        rect.origin.x = _segment.frame.size.width * index;
        _segment.frame = rect;
    }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
