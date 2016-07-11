//
//  OtherAaimeViewController.m
//  exercise
//
//  Created by 哲 on 16/7/11.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "OtherAaimeViewController.h"
#import "HomeButtonView.h"
@interface OtherAaimeViewController()<buttonClick>
@property(nonatomic,strong)UIImageView *imageAime;
@end
@implementation OtherAaimeViewController
- (void)dealloc
{
    _imageAime = nil;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    _imageAime = [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    _imageAime.image =[UIImage imageNamed:@"icon_baiban"];
    [self.view addSubview:_imageAime];
    HomeButtonView *home =[[HomeButtonView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 164, ScreenWidth, 100)];
    [home array:@[@"缩放",@"旋转",@"虚化",@"颤抖" ,@"曲线"]];
    home.delegate =self;
    [self.view addSubview:home];
    
}
-(void)getButtonClickTag:(NSInteger)tag
{
    switch (tag) {
        case 0:
            [self suofang];
            break;
        case 1:
            [self xuanzhuan];
            break;
        case 2:
            [self xuhua];
            break;
        case 3:
            [self chandou];
            break;
        case 4:
            [self quxian];
            break;
        default:
            break;
    }
}
//缩放
-(void)suofang
{
    [UIView animateWithDuration:3 animations:^{
        //动画的逻辑
        //        _imageAime.frame =CGRectMake(50, 100, 100, 100);
        _imageAime.frame =CGRectMake(10, 200, 300, 250);
    } completion:^(BOOL finished) {
        //动画结束之后要执行的代码
        //重开了一个UIView动画，还原位置
        [UIView animateWithDuration:3 animations:^{
            _imageAime.frame =CGRectMake(50, 100, 100, 100);
        }];
    }];
    
}
//旋转
-(void)xuanzhuan
{
    CABasicAnimation *basianimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [basianimation setDuration:10];
    [basianimation setRepeatCount:2];
    basianimation.fromValue = [NSNumber numberWithDouble:2];
    basianimation.toValue = [NSNumber numberWithDouble:M_PI * 20];
    [_imageAime.layer addAnimation:basianimation forKey:nil];
    basianimation.autoreverses = YES;
    
}
//
-(void)xuhua
{
    //第三种UIView动画的另一种写法（没有block）
    [UIView beginAnimations:@"view动画的另一种写法" context:nil];
    //设置时长
    [UIView setAnimationDuration:1];
    //设置重复次数
    [UIView setAnimationRepeatCount:NSIntegerMax];
    //动画的逻辑
    _imageAime.alpha =0.4;
    //结束动画
    [UIView commitAnimations];
}
-(void)chandou
{
    //2,延时时间（等待）3，颤抖效果，值越小，抖动的越厉害 4，开始时的动画速度，值越大速度越快
    [UIView animateWithDuration:2 delay:1 usingSpringWithDamping:0.2 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _imageAime.frame =CGRectMake(100, 400, 300, 250);
    } completion:^(BOOL finished) {
        
    }];
}
-(void)quxian
{
    //关键帧动画
    CAKeyframeAnimation *keyanimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建一个路径， 用来记录每一帧
    CGMutablePathRef path = CGPathCreateMutable();
    //指定移动的起点
    CGPathMoveToPoint(path, NULL, _imageAime.center.x, _imageAime.center.y);
    //画一条曲线（贝塞尔曲线）
    CGPathAddCurveToPoint(path, NULL, 100, 100, 370, 320, 100, 690);
    
    //设置路径
    [keyanimation setPath:path];
    //设置时间
    [keyanimation setDuration:3];
    //设置重复次数
    [keyanimation setRepeatCount:1];
    
    [_imageAime.layer addAnimation:keyanimation forKey:@"keyanimation"
     ];
    
}

@end
