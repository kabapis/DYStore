//
//  CMTabBar.m
//  test
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "CMTabBar.h"
#import "CMTabBarItem.h"

@implementation CMTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectedIndex = 0;
    }
    return self;
}

- (void)setupTabBarItemCaches
{
    if (![self.titles count]) return;
    
    if (tabBarItemCaches == nil) {
        tabBarItemCaches = [[NSMutableArray alloc] init];
    }
    if ([tabBarItemCaches count]) {
        [tabBarItemCaches makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [tabBarItemCaches removeAllObjects];
    }
    for (int i = 0; i < [self.titles count]; i++) {
        CMTabBarItem *tabBarItem = [self createTabBarItem];
        [tabBarItem setTag:i];
        [tabBarItem addTarget:self action:@selector(actionTabBarItem:) forControlEvents:(UIControlEventTouchUpInside)];
        [tabBarItemCaches addObject:tabBarItem];
        [self addSubview:tabBarItem];
    }
}

- (CMTabBarItem *)createTabBarItem
{
    CMTabBarItem *tabBarItem = [[CMTabBarItem alloc] init];
    tabBarItem.backgroundColor = [UIColor clearColor];
    
    return tabBarItem;
}

- (void)actionTabBarItem:(CMTabBarItem *)tabBarItem
{
    self.selectedIndex = tabBarItem.tag;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItem:)]) {
        [self.delegate tabBar:self didSelectItem:tabBarItem];
    }
}

- (void)setTitles:(NSArray *)titles
{
    if (_titles != titles) {
        _titles = titles;
        
        [self setupTabBarItemCaches];
        [self setNeedsLayout];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    
    if (selectedIndex < [self numberOfItems]) {
        for (int i = 0; i < [self numberOfItems]; i++) {
            CMTabBarItem *tabBarItem = tabBarItemCaches[i];
            tabBarItem.selected = (i == selectedIndex);
        }
    }
    [self setNeedsLayout];
}

- (NSUInteger)numberOfItems
{
    return [tabBarItemCaches count];
}

- (CMTabBarItem *)selectedTabBarItem
{
    return [self tabBarItemWithIndex:_selectedIndex];
}

- (CMTabBarItem *)tabBarItemWithIndex:(NSUInteger)index
{
    if (index < [self numberOfItems]) {
        return tabBarItemCaches[index];
    }
    return nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat boundsW = self.bounds.size.width;
    CGFloat boundsH = self.bounds.size.height;
    CGFloat itemW = boundsW;
    CGFloat itemH = boundsH;
    CGFloat itemX = 0;
    CGFloat itemY = boundsH/2 - itemH/2;
    
    NSUInteger count = [self numberOfItems];
    if (count > 0) {
        itemW = boundsW/count;
        
        for (int i = 0; i < count; i++) {
            CMTabBarItem *tabBarItem = tabBarItemCaches[i];
            tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
            if (i < [self.titles count]) {
                tabBarItem.title = self.titles[i];
            }
            itemX = itemX + itemW;
        }
    }
}

@end
