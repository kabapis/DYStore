//
//  BannerSegmentBar.h
//  DYNet
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ANIMATION_DURATION 0.25f

@interface BannerSegmentBar : UIView
-(instancetype)createBannerSegmentBarWithImageCount:(CGFloat)imgCount AndSegmentBackgroundColor:(UIColor *)color ViewX:(CGFloat)x ViewY:(CGFloat)Y ViewHeight:(CGFloat)height;

-(void)changeBannerSegmentFrameWithIndex:(NSInteger)index;

@end
