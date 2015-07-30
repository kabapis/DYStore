//
//  CMViewController.h
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CMViewControllerDelegate <NSObject>

- (void)reloadData;

@end

@interface CMViewController : UIViewController
{
    UIView *_titleView;
    UILabel *_titleLabel;    
}

@property(nonatomic, assign) id<CMViewControllerDelegate> viewDelegate;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic) int naviBackIndex;

- (void)_handleEndEditing;
//页面返回事件
- (void)_handleViewBack;
//从导航栏栈中获取UIViewController
- (UIViewController *)viewControllerWithNaviIndex:(int)naviIndex;


@end
