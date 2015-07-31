//
//  TabBarController.m
//  weibo
//
//  Created by MyMac on 15/7/18.
//  Copyright (c) 2015年 MyMac. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "HomeController.h"
#import "ActivityController.h"
#import "FigureShowController.h"
#import "MyProfileController.h"
#import "LoginController.h"

typedef enum : NSUInteger {
    HomeTabBarItemTag = 10000,
    ActivityTabBarItemTag,
    FigureShowTabBarItemTag,
} tabBarItemTag;


@interface TabBarController ()

@end

@implementation TabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeController *home = [[HomeController alloc] init];
    [self addChildVC:home tabBarItemTag:10 title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    

    ActivityController *message = [[ActivityController alloc] init];
    [self addChildVC:message tabBarItemTag:11 title:@"活动" image:@"tabbar_activity" selectedImage:@"tabbar_activity_selected"];
    
    FigureShowController *discover = [[FigureShowController alloc] init];
    [self addChildVC:discover tabBarItemTag:12 title:@"身材秀" image:@"tabbar_figureshow" selectedImage:@"tabbar_figureshow_selected"];
    
    MyProfileController *profile = [[MyProfileController alloc] init];
    [self addChildVC:profile tabBarItemTag:13 title:@"个人" image:@"tabbar_myprofile" selectedImage:@"tabbar_myprofile_selected"];
    
    
}


- (void)addChildVC:(UIViewController *)childVC tabBarItemTag:(int)tag title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    childVC.tabBarItem.title = title;
//    childVC.navigationItem.title = title;
    
//    childVC.title = title;
    
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = RGB(76, 76, 76);
    textAttrs[NSFontAttributeName] = [UIFont fontWithSize:14];
    
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = RGB(176, 148, 80);
    
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    childVC.tabBarItem.tag = tag;
    
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item   //当点击相应得UITabBarItem时被调用
//{
//    DBLog(@"%ld",(long)item.tag);
////    DBLog(@"%@",item);
//    switch (item.tag)
//    {
//        case 13:
//        {
//            NSString *userid = @"";
//            if ([userid isEqual:@""]) {
//                LoginController *login = [[LoginController alloc] init];
//                NavigationController *nav = [[NavigationController alloc] initWithRootViewController:login];
//                [self.navigationController presentViewController:nav animated:YES completion:^{
//                    
//                }];
//            }
//        }
//            break;
//        case 2:
//            DBLog(@"2");
//            break;
//        case 3:
//            DBLog(@"3");
//            break;
//        case 4:
//            break;
//        default:
//            break;
//    }
//}

@end
