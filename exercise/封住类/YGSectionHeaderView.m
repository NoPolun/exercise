//
//  YGSectionHeaderView.m
//  MobileUU
//
//  Created by UTOUU on 16/3/19.
//  Copyright © 2016年 Shanghai Pecker Network Technology. All rights reserved.
//

#import "YGSectionHeaderView.h"

@implementation YGSectionHeaderView
- (void)setFrame:(CGRect)frame{
    CGRect sectionRect = [self.tableView rectForSection:self.section];
    CGRect newFrame = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(sectionRect), CGRectGetWidth(frame), CGRectGetHeight(frame));
    [super setFrame:newFrame];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
