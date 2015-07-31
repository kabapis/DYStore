//
//  CMStaticCellItem.h
//  DYNet
//
//  Created by MyMac on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMStaticCellItem : NSObject

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *assist;

@property (nonatomic,assign) BOOL showArrow;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title showArrow:(BOOL)showArrow;

+ (CMStaticCellItem *)itemWithIcon:(NSString *)icon title:(NSString *)title showArrow:(BOOL)showArrow;

@end
