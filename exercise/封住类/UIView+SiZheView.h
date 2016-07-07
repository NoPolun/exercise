//
//  UIView+SiZheView.h
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGSectionHeaderView.h"
@interface UIView (SiZheView)
//tableView等section的边线去除
+(YGSectionHeaderView *)removeLinesTableView:(UITableView *)tableview section :(NSInteger)section color:(UIColor *)color;
@end
