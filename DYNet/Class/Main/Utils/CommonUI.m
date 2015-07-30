//
//  CommonUI.m
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "CommonUI.h"

@implementation CommonUI

+ (UIButton *)itemButtonWithTitle:(NSString *)title
                           target:(id)target
                           action:(SEL)action
                            image:(UIImage *)image
                    selectedImage:(UIImage *)selectedImage
{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitle:title forState:(UIControlStateHighlighted)];
    [button.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [button setImage:image forState:(UIControlStateNormal)];
    [button setImage:selectedImage forState:(UIControlStateHighlighted)];
    [button setAdjustsImageWhenHighlighted:NO];
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    return button;
}

+ (UIBarButtonItem *)navItem_Back:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemBack"];
    UIImage *selectedImage = [UIImage imageNamed:@"navItemBackSelected"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action image:image
                                           selectedImage:selectedImage];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setImageEdgeInsets:UIEdgeInsetsMake(0, -18, 0, 18)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItem_Personal:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemPersonal"];
    UIImage *selectedImage = [UIImage imageNamed:@"navItemPersonalSelected"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action image:image
                                           selectedImage:selectedImage];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setImageEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItem_Setting:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemSetting"];
    UIImage *selectedImage = [UIImage imageNamed:@"navItemSettingSelected"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action image:image selectedImage:selectedImage];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setImageEdgeInsets:UIEdgeInsetsMake(0, 12, 0, -12)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItem_Search:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"navItemSearch"];
    UIImage *selectedImage = [UIImage imageNamed:@"navItemSearchSelected"];
    
    UIButton *itemButton = [CommonUI itemButtonWithTitle:nil target:target action:action image:image
                                           selectedImage:selectedImage];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setImageEdgeInsets:UIEdgeInsetsMake(0, 13, 0, -13)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *itemButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [itemButton setBackgroundColor:[UIColor clearColor]];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setTitle:title forState:(UIControlStateNormal)];
    [itemButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [itemButton.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [itemButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
    [itemButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

+ (UIBarButtonItem *)navItemLWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *itemButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [itemButton setBackgroundColor:[UIColor clearColor]];
    [itemButton setFrame:CGRectMake(0, 0, 44, 44)];
    [itemButton setTitle:title forState:(UIControlStateNormal)];
    [itemButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [itemButton.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [itemButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    [itemButton addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:(itemButton)];
    return barItem;
}

@end
