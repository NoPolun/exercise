//
//  UIView+SiZheView.m
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "UIView+SiZheView.h"

@implementation UIView (SiZheView)
//tableView等section的边线去除
+(YGSectionHeaderView *)removeLinesTableView:(UITableView *)tableView section:(NSInteger)section color:(UIColor *)color
{
    YGSectionHeaderView *sectionHead = [[YGSectionHeaderView alloc] init];
    sectionHead.backgroundColor =color;
    sectionHead.section = section;
    sectionHead.tableView = tableView;
    return sectionHead;
 
}
@end
