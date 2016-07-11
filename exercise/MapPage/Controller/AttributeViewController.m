//
//  AttributeViewController.m
//  exercise
//
//  Created by 哲 on 16/7/11.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "AttributeViewController.h"
#import "HomeButtonView.h"
@interface  AttributeViewController()<buttonClick>
{
    CALayer *_imagelayer;
}
@end
@implementation AttributeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _imagelayer = [CALayer layer];
    _imagelayer.cornerRadius =6;
    _imagelayer.borderWidth = 1;
    _imagelayer.borderColor =[UIColor blueColor].CGColor;
    _imagelayer.masksToBounds = YES;
    _imagelayer.frame = CGRectMake(30, 30, 100, 115);
    _imagelayer.contents = (id)[[UIImage imageNamed:@"icon_baiban"]CGImage];
    [self.view.layer addSublayer:_imagelayer];
    HomeButtonView *home =[[HomeButtonView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 100, ScreenWidth, 50)];
    home.delegate = self;
    NSArray *array =@[@"位移",@"旋转",@"缩放",@"动画组"];
    [self.view addSubview:home];
    [home array:array];
}
-(void)getButtonClickTag:(NSInteger)tag
{
    switch (tag) {
        case 0:
            [self move];
            break;
        case 1:
            [self rotate];
            break;
        case 2:
            [self scale];
            break;
        case 3:
            [self group];
            break;
        default:
            break;
    }
}
//位移
-(void)move
{
    CGPoint fromPoint = _imagelayer.position;
    CGPoint toPoint = CGPointMake(fromPoint.x +80, fromPoint.y);
    CABasicAnimation *anim =[CABasicAnimation animationWithKeyPath:@"pasition"];
    anim.fromValue =[NSValue valueWithCGPoint:fromPoint];
    anim.toValue = [NSValue valueWithCGPoint:toPoint];
    anim.duration = 0.5;
    _imagelayer.position = toPoint;
    anim.removedOnCompletion = YES;
    [_imagelayer addAnimation:anim forKey:nil];
}
//旋转
-(void)rotate
{
     CABasicAnimation *anim =[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromeValue = _imagelayer.transform;
    anim.fromValue = [NSValue valueWithCATransform3D:fromeValue];
    CATransform3D toValue = CATransform3DRotate(fromeValue,  M_PI, 1, 0, 0);
//    CATransform3D toValue = CATransform3DRotate(fromeValue,  M_PI, 0, 1, 0);
//    CATransform3D toValue = CATransform3DRotate(fromeValue,  M_PI, 0, 0, 1);
    anim.toValue = [NSValue valueWithCATransform3D:toValue];
    anim.duration = 0.5;
    _imagelayer.transform = toValue;
    anim.removedOnCompletion = YES;
    [_imagelayer addAnimation:anim forKey:nil];
}
//缩放
-(void)scale
{
    CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    anim.values =[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:_imagelayer.transform],[NSValue valueWithCATransform3D:CATransform3DScale(_imagelayer.transform, 0.2, 0.2, 1)],[NSValue valueWithCATransform3D:CATransform3DScale(_imagelayer.transform, 2, 2, 1)],[NSValue valueWithCATransform3D:_imagelayer.transform], nil];
    anim.duration =5;
    anim.removedOnCompletion = YES;
    [_imagelayer addAnimation:anim forKey:nil];
}
//动画组
-(void)group
{
    CGPoint fromPoint = _imagelayer.position;
    CGPoint toPoint =CGPointMake(280, fromPoint.y + 200);
    CABasicAnimation *moveAnim =[CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue =[NSValue valueWithCGPoint:fromPoint];
    moveAnim.toValue =[NSValue valueWithCGPoint:toPoint];
    moveAnim.removedOnCompletion = YES;
    CABasicAnimation *transform =[CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromeValue =_imagelayer.transform;
    transform.fromValue =[NSValue valueWithCATransform3D:fromeValue];
    CATransform3D scaleValue = CATransform3DScale(fromeValue, 0.5, 0.5, 1);
    
    CATransform3D rotateValue = CATransform3DRotate(fromeValue, M_PI, 0, 0, 1);
    CATransform3D tovalue =CATransform3DConcat(scaleValue, rotateValue);
    transform.toValue =[NSValue valueWithCATransform3D:tovalue];
    transform.cumulative = YES;
    transform.repeatCount= 2;
    transform.duration = 3;
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim,transform, nil];
    animGroup.duration =6;
    [_imagelayer addAnimation:animGroup forKey:nil];
}

@end
