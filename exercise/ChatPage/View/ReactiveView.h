//
//  ReactiveView.h
//  exercise
//
//  Created by 哲 on 16/12/3.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReactiveView : UIView
@property(nonatomic,strong)RACSubject *subjectClick;
@end
