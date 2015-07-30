//
//  CMStaticCellItem.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "CMStaticCellItem.h"

@implementation CMStaticCellItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title showArrow:(BOOL)showArrow{
    self = [super init];
    if (self) {
        self.icon = icon;
        self.title = title;
        self.showArrow = showArrow;
    }
    return self;
}

+ (CMStaticCellItem *)itemWithIcon:(NSString *)icon title:(NSString *)title showArrow:(BOOL)showArrow{
    CMStaticCellItem *staticCellItem = [[CMStaticCellItem alloc] initWithIcon:icon title:title showArrow:showArrow];
    return staticCellItem;
}

@end
