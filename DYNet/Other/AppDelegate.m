//
//  AppDelegate.m
//  DYNet
//
//  Created by Apple on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "NavigationController.h"
#import "CustomURLCache.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;

    
    //create TabBar
    [self createTabBar];
    
    //setting cache
    [self setCache];
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark TabBar and Application Appearance

-(void)createTabBar
{
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    TabBarController *tab = [[TabBarController alloc] init];
    self.window.rootViewController = tab;
}

#pragma mark setting URLRequest cache

- (void)setCache
{
    CustomURLCache * cache = [[CustomURLCache alloc] initWithMemoryCapacity:2*1024*1024 diskCapacity:0 diskPath:nil];
    [NSURLCache setSharedURLCache:cache ];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
