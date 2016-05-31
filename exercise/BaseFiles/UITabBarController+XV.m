//
//  UITabBarController+XV.m
//  UTabbuttonitem
//
//  Created by 哲 on 15/9/17.
//  Copyright (c) 2015年 xusizhe. All rights reserved.
//

#import "UITabBarController+XV.h"
#import "SZBasenavigationController.h"
@implementation UITabBarController (XV)
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationColor:(UIColor *)navColor tabBarImage:(UIImage *)tabBarImage textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor

{
    UITabBarController *tabBarXV =[[UITabBarController alloc]init];
    tabBarXV.viewControllers =  [self p_initWithTabBarArray:array imageXV:imageArray textXV:textArray];
    [self p_tabBar:tabBarXV textBeforeColor:beforColor textAfterColor:afterColor];
    [[UINavigationBar appearance]setBarTintColor:navColor];
    [[UITabBar appearance]setBackgroundImage:tabBarImage];
    return tabBarXV;
}
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationColor:(UIColor *)navColor tabBarColor:(UIColor *)tabBarColor textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor

{
    
    UITabBarController *tabBarXV =[[UITabBarController alloc]init];
    tabBarXV.viewControllers =  [self p_initWithTabBarArray:array imageXV:imageArray textXV:textArray];
    [self p_tabBar:tabBarXV textBeforeColor:beforColor textAfterColor:afterColor];
    [[UINavigationBar appearance]setBarTintColor:navColor];
    [[UITabBar appearance]setBarTintColor:tabBarColor];
    return tabBarXV;
}
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationImage:(UIImage *)navImage tabBarColor:(UIColor *)tabBarColor textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor

{
    UITabBarController *tabBarXV =[[UITabBarController alloc]init];
    tabBarXV.viewControllers =  [self p_initWithTabBarArray:array imageXV:imageArray textXV:textArray];
    [self p_tabBar:tabBarXV textBeforeColor:beforColor textAfterColor:afterColor];
    [[UINavigationBar appearance]setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance]setBarTintColor:tabBarColor];
    return tabBarXV;
}
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navImage:(UIImage *)navImage tabBarImage:(UIImage *)tabBarImage textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor

{
    UITabBarController *tabBarXV =[[UITabBarController alloc]init];
    tabBarXV.viewControllers =  [self p_initWithTabBarArray:array imageXV:imageArray textXV:textArray];
    [self p_tabBar:tabBarXV textBeforeColor:beforColor textAfterColor:afterColor];
    [[UINavigationBar appearance]setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance]setBackgroundImage:tabBarImage];
    
    return tabBarXV;
}


+(NSMutableArray *)p_initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray
{
    NSMutableArray *arrayTab =[NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        SZBasenavigationController *nav =[[SZBasenavigationController alloc]initWithRootViewController:[array objectAtIndex:i]];
        NSLog(@"%@",[array objectAtIndex:i]);
        UIImage *image1 =[UIImage imageNamed:imageArray[i*2]];
        image1 =[image1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *image2 =[UIImage imageNamed:imageArray[i*2+1]];
        image2 =[image2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem  =[[UITabBarItem alloc]initWithTitle:textArray[i] image:image1 selectedImage:image2];
        [arrayTab addObject:nav];
    }
    return  arrayTab;
}


+(void)p_tabBar:(UITabBarController *)tabBar textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor
{
    
    [[UINavigationBar appearance]setHidden:NO];
    [[UINavigationBar appearance]setTranslucent:NO];
    [[UINavigationBar appearance]setHidden:NO];
    [[UINavigationBar appearance]setTranslucent:NO];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       beforColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       afterColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    
    
}

@end
