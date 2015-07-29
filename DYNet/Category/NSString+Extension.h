//
//  NSString+Extension.h
//  DYNet
//
//  Created by MyMac on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

//计算文字的大小
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

//计算文字大小
- (CGSize)sizeWithFont:(UIFont *)font;


@end
