//
//  UIBarButtonItem+SiZheButtonItem.h
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"
@interface UIBarButtonItem (SiZheButtonItem)
+(instancetype)initWithLeftButtonItem:(NSString *)imageString selectImage:(NSString *)selectString addTarget:(id)target action:(SEL)action;

@end
