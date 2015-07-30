//
//  MyHUD.m
//  DYNet
//
//  Created by Apple on 15/7/30.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "MyHUD.h"

static MyHUD * hud;

@interface MyHUD ()
{
    UIAlertView * alertView;
}
@end

@implementation MyHUD
+(MyHUD *)shareMyHUD
{
    dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        hud = [[super alloc] init];
    });
    
    return hud;
}

#pragma mark show hud system bring

-(void)showMyHUD:(NSString *)string 
{
    alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:string delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    
    [self performSelector:@selector(dismissAlertView) withObject:nil afterDelay:2.0f];;
}

-(void)dismissAlertView
{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark the custom hud not system bring

-(void)showMyHUDWithWarning:(NSString *)string
{
    //waiting for writing......
}

@end
