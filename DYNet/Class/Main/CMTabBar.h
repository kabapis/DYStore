//
//  CMTabBar.h
//  test
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMTabBarItem,CMTabBar;

@protocol CMTabBarDelegate <NSObject>

@optional

- (void)tabBar:(CMTabBar *)tabBar didSelectItem:(CMTabBarItem *)tabBarItem;

@end

@interface CMTabBar : UIView
{
@package
    NSMutableArray *tabBarItemCaches;
    NSUInteger _selectedIndex;
    NSArray *_titles;
}

@property(nonatomic, assign) id<CMTabBarDelegate> delegate;
@property(nonatomic, retain) NSArray *titles;
@property(nonatomic) NSUInteger selectedIndex;

- (NSUInteger)numberOfItems;

- (CMTabBarItem *)selectedTabBarItem;

- (CMTabBarItem *)tabBarItemWithIndex:(NSUInteger)index;

@end
