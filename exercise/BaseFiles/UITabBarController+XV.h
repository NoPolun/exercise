//
//  UITabBarController+XV.h
//  UTabbuttonitem
//
//  Created by 哲 on 15/9/17.
//  Copyright (c) 2015年 xusizhe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UITabBarController (XV)
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationColor:(UIColor *)navColor tabBarImage:(UIImage *)tabBarImage textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor;
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationColor:(UIColor *)navColor tabBarColor:(UIColor *)tabBarColor textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor;
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navigationImage:(UIImage *)navImage tabBarColor:(UIColor *)tabBarColor  textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor;
+(instancetype)initWithTabBarArray:(NSArray *)array imageXV:(NSArray *)imageArray textXV:(NSArray *)textArray navImage:(UIImage *)navImage tabBarImage:(UIImage *)tabBarImage  textBeforeColor:(UIColor *)beforColor textAfterColor:(UIColor *)afterColor;
@end
