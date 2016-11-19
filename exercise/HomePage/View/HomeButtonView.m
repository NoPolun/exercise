//
//  HomeButtonView.m
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "HomeButtonView.h"

@implementation HomeButtonView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
    }
    
    
    return self;
}

-(void)dictionary:(NSDictionary *)diction
{
    CGFloat space = 5.0;
    NSArray *array =[diction objectForKey:@"arrayButton"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 按钮
        int low = idx % 4; // x
        int web = idx / 4;
        NSInteger widthButton =[[diction objectForKey:@"width"] integerValue];
        NSInteger highButton = [[diction objectForKey:@"high"]integerValue];
        //获取的x轴坐标
        CGFloat widthX = ((ScreenWidth - widthButton * 4) / 5.0) * (low+1) + widthButton *low;
        //获取Y轴坐标
        CGFloat highY = (self.frame.size.height - 2*highButton)/3.0*(web+1)+highButton*web;
        UIButton* buttonClick =[UIButton buttonWithType:UIButtonTypeCustom];
        //此处具体坐标值根据自己公司的需求进行更改
        buttonClick.frame =CGRectMake (widthX ,highY,widthButton,highButton);
        [buttonClick setImage:[UIImage imageNamed:[obj objectForKey:@"image"]] forState:UIControlStateNormal];
        [buttonClick setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttonClick setTitle:[obj objectForKey:@"title"] forState:UIControlStateNormal];
        buttonClick.tag = idx;
        //防止多个button同时点击
        [buttonClick  setExclusiveTouch:YES];
        [buttonClick addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        //此处为设置图片和文字的相对位置
        [buttonClick layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                     imageTitleSpace:space fontsize:14.0 color:RGB(51, 51, 51)];
                [self addSubview:buttonClick];
    }];
    
}
-(void)array:(NSArray *)array
{
     CGFloat space = 0.0;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 按钮
        int low = idx % 4; // x
        int web = idx / 4;
        NSInteger widthButton =44;
        NSInteger highButton = 44;
        //获取的x轴坐标
        CGFloat widthX = ((ScreenWidth - widthButton * 4) / 5.0) * (low+1) + widthButton *low;
        //获取Y轴坐标
        CGFloat highY = (self.frame.size.height - 2*highButton)/3.0*(web+1)+highButton*web;
        UIButton* buttonClick =[UIButton buttonWithType:UIButtonTypeCustom];
        //此处具体坐标值根据自己公司的需求进行更改
        buttonClick.frame =CGRectMake (widthX ,highY,widthButton,highButton);
        [buttonClick setExclusiveTouch:YES];
       
        [buttonClick setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttonClick setTitle:obj
                     forState:UIControlStateNormal];
        buttonClick.tag = idx;
        [buttonClick addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        //此处为设置图片和文字的相对位置
        [buttonClick layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                     imageTitleSpace:space fontsize:14.0 color:RGB(51, 51, 51)];
        [self addSubview:buttonClick];
    }];
    
}
-(void)click:(UIButton *)sender
{
    [self.delegate getButtonClickTag:sender.tag];
}


@end
