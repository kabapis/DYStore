//
//  MyHUD.h
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHUD : NSObject
+(MyHUD *)shareMyHUD;

//系统自带的提示框
-(void)showMyHUD:(NSString *)string;

//自定义提示框
-(void)showMyHUDWithWarning:(NSString *)string;


@end
