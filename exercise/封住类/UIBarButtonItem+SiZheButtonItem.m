//
//  UIBarButtonItem+SiZheButtonItem.m
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "UIBarButtonItem+SiZheButtonItem.h"

@implementation UIBarButtonItem (SiZheButtonItem)
+(instancetype )initWithLeftButtonItem:(NSString *)imageString selectImage:(NSString *)selectString addTarget:(id)target action:(SEL)action
{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[imageString getImageTheRenderingString] forState:UIControlStateNormal];
    [button setBackgroundImage:[selectString getImageTheRenderingString] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
 
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+(instancetype)initWithLeftButtonItem:(NSString *)string color:(UIColor *)color addTarget:(id)target action:(SEL)action
{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
