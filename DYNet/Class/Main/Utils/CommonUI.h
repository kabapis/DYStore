//
//  CommonUI.h
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUI : NSObject

+ (UIBarButtonItem *)navItem_Back:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navItem_Personal:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navItem_Setting:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navItem_Search:(id)target action:(SEL)action;

+ (UIBarButtonItem *)navItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)navItemLWithTitle:(NSString *)title target:(id)target action:(SEL)action;

@end
