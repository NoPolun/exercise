//
//  CLayerViewController.m
//  exercise
//
//  Created by 哲 on 16/7/11.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "CLayerViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation CLayerViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];
    //    圆角半径
    self.view.layer.cornerRadius = 10;
    //    边框宽度
    self.view.layer.borderWidth = 4;
    //    边框的颜色
    self.view.layer.borderColor =[UIColor redColor].CGColor;
    //    创建不同的CALayer对象
    [self firstLayer];
    [self secondLayer];
    [self threeLayer];
//    self.navigationController.navigationBar.hidden =YES;
    
    
}

-(void)firstLayer
{
    //    创建对象
    CALayer *firstLayer =[CALayer layer];
    firstLayer.backgroundColor =[UIColor magentaColor].CGColor;
    firstLayer.cornerRadius = 8;
    firstLayer.borderWidth = 2;
    //    设置阴影的的模糊程度（值越大阴影越模糊）
    firstLayer.borderColor =[UIColor blackColor].CGColor;
    firstLayer.shadowRadius = 1;
    firstLayer.shadowColor =[UIColor blackColor].CGColor;
    //    设置阴影的透明程度
    firstLayer.shadowOpacity = 0.8;
    firstLayer.frame =CGRectMake(30, 30, 140, 160);
    [self.view.layer addSublayer:firstLayer];
}
-(void)secondLayer
{
    CALayer *secondLayer =[CALayer layer];
    secondLayer.backgroundColor =[UIColor magentaColor].CGColor;
    secondLayer.cornerRadius = 8;
    secondLayer.borderWidth = 2;
    //    设置阴影的的模糊程度（值越大阴影越模糊）
    secondLayer.borderColor =[UIColor blackColor].CGColor;
    secondLayer.shadowOffset = CGSizeMake(4, 5);
    secondLayer.shadowRadius = 1;
    secondLayer.shadowColor =[UIColor blackColor].CGColor;
    //    设置阴影的透明程度
    secondLayer.shadowOpacity = 0.8;
    secondLayer.masksToBounds = YES;
    secondLayer.frame =CGRectMake(200, 30, 140, 160);
    [self.view.layer addSublayer:secondLayer];
    CALayer *secondLayerImage =[CALayer layer];
    //    设置显示的图片
    secondLayerImage.contents = (id)[[UIImage imageNamed:@"任务"]CGImage];
    
    secondLayerImage.frame = secondLayer.bounds;
    [secondLayer addSublayer:secondLayerImage];
    
    
    
    
}
-(void)threeLayer
{
    CALayer *threeLayer =[CALayer layer];
    threeLayer.delegate =self;
    threeLayer.backgroundColor =[UIColor greenColor].CGColor;
    //    阴影的偏移量
    threeLayer.shadowOffset =CGSizeMake(0, 3);
    threeLayer.cornerRadius = 10;
    threeLayer.borderWidth = 2;
    //    设置阴影的的模糊程度（值越大阴影越模糊）
    threeLayer.borderColor =[UIColor blackColor].CGColor;
    threeLayer.shadowRadius = 5.0;
    threeLayer.shadowColor =[UIColor blackColor].CGColor;
    //    设置阴影的透明程度
    threeLayer.shadowOpacity = 0.8;
    threeLayer.masksToBounds =YES;
    threeLayer.frame =CGRectMake(30, 220, 310, 210);
    [self.view.layer addSublayer:threeLayer];
    //    此句用于通知CALayer调用delegate的方法
    [threeLayer setNeedsDisplay];
}
//重写该方法为CALayer绘制自定义内容
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIColor *bgColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_baiban"]];
    CGContextSetFillColorWithColor(ctx, bgColor.CGColor);
    CGContextFillEllipseInRect(ctx, CGRectMake(20, 20, 110, 110));
    CGContextAddArcToPoint(ctx, 180, 20, 100, 60, 5);
    CGContextFillPath(ctx);
    CGContextSetRGBStrokeColor(ctx, 5, 160, 150, 60);
    CGContextSetRGBFillColor(ctx, .5, 1, 1, 1);
    CGContextFillPath(ctx);
}
@end
