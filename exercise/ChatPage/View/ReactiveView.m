//
//  ReactiveView.m
//  exercise
//
//  Created by 哲 on 16/12/3.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "ReactiveView.h"

@implementation ReactiveView
-(RACSubject *)subjectClick
{
    if (_subjectClick == nil) {
        _subjectClick =[RACSubject subject];
    }
    return _subjectClick;
}
-(IBAction)chanzhiBtn:(id)sender
{
    [self.subjectClick sendNext:@"发送值"];
}

-(IBAction)btnClick:(id)sender
{
    
}
@end
