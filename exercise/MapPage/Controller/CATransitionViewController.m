//
//  CATransitionViewController.m
//  exercise
//
//  Created by 哲 on 16/7/11.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "CATransitionViewController.h"
@implementation CATransitionViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UIView *magentaView =[[UIView alloc]initWithFrame:self.view.bounds];
    magentaView.backgroundColor =[UIColor magentaColor];
    [self.view addSubview:magentaView];
    UIView * gtayView =[[UIView alloc]initWithFrame:self.view.bounds];
    gtayView.backgroundColor =[UIColor lightGrayColor];
    [self.view addSubview:gtayView];
    NSArray *array =@[@"添加",@"翻页",@"移入",@"揭开",@"立方体",@"吸入",@"翻转",@"水波"];
    
    HomeButtonView *homebutton =[[HomeButtonView alloc]init];
    [self.view addSubview:homebutton];
    homebutton.frame =CGRectMake(0,ScreenHeight-164, ScreenWidth, 100);
    homebutton.delegate =self;
    [homebutton array:array];
}

-(void)getButtonClickTag:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            [self add];
        }
            break;
        case 1:
        {
            [self curl];

        }
            break;
        case 2:
        {
            [self move];
        }
            break;
        case 3:
        {
            [self reveal];
        }
            break;
        case 4:
        {
            [self cube];
        }
            break;
        case 5:
        {
            [self suck];
        }
            break;
        case 6:
        {
            [self oglFlip];
        }
            break;
        case 7:
        {
            [self ripple];
        }
            break;
        default:
            break;
    }
    
}
//提交
-(void)add{
    //    开始动画
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

    //     提交动画
    [UIView commitAnimations];


}
//翻页
-(void)curl
{
    //    开始动画
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    //     提交动画
    [UIView commitAnimations];
}
//移入
-(void)move
{
    CATransition *strasiton =[CATransition animation];
    strasiton.duration = 2.0f;
     //    使用kCATransitionMoveIn动画
    strasiton.type = kCATransitionMoveIn;
    //      指定动画方向，从左向右
    strasiton.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:strasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}
//揭开
-(void)reveal
{
    
    CATransition *strasiton =[CATransition animation];
    strasiton.duration = 2.0f;
    //    使用kCATransitionReveal动画
    strasiton.type = kCATransitionReveal;
     strasiton.subtype = kCATransitionFromTop;
    [self.view.layer addAnimation:strasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

}
//立方体
-(void)cube
{
    CATransition *trasiton =[CATransition animation];
    trasiton.duration = 2.0f;
    trasiton.type = @"cube";
    trasiton.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:trasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}
//吸入
-(void)suck
{
    CATransition *trasiton =[CATransition animation];
    trasiton.duration = 2.0f;
    trasiton.type = @"suckEffect";
    trasiton.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:trasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}
//翻转
-(void)oglFlip
{
    CATransition *trasiton =[CATransition animation];
    trasiton.duration = 2.0f;
    trasiton.type = @"oglFlip";
    trasiton.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:trasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
}
//水波
-(void)ripple
{
    CATransition *trasiton =[CATransition animation];
    trasiton.duration = 2.0f;
    trasiton.type = @"rippleEffect";
    trasiton.subtype = kCATransitionFromLeft;
    [self.view.layer addAnimation:trasiton forKey:@"animation"];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
}

@end
