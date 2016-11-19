//
//  UINavigationBar+SZdeleteLine.m
//  exercise
//
//  Created by 哲 on 16/7/15.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "UINavigationBar+SZdeleteLine.h"

@implementation UINavigationBar (SZdeleteLine)
+(void)setDeleteNavLine:(UINavigationBar *)navigationBar color:(UIColor*)color
{
    [navigationBar setBackgroundImage:[UIImage createImageWithColor:color] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:[UIImage new]];
    
}


@end
