//
//  CMTabBarItem.h
//  test
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMTabBarItem : UIControl
{
    UILabel *titleLabel;
    
    NSString *_title;
    UIFont *_font;
    UIColor *_titleColor;
    UIColor *_titleColorSelected;
    BOOL _selected;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) UIFont *font;
@property(nonatomic, retain) UIColor *titleColor;
@property(nonatomic, retain) UIColor *titleColorSelected;

@property(nonatomic, getter=isSelected) BOOL selected;

@end
