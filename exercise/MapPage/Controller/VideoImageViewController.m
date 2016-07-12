//
//  VideoImageViewController.m
//  exercise
//
//  Created by 哲 on 16/7/12.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "VideoImageViewController.h"
#import "UIImage+Video.h"

@implementation VideoImageViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *image =[[UIImageView alloc]initWithFrame:CGRectMake(50, 80, 100, 100)];
    [self.view addSubview:image];
    image.backgroundColor =[UIColor redColor];
    image.image = [UIImage imageWithVideo:@"http://cdn1.utouu.com/ui/pc/skin/usercenter/video/utouu-video-v1.mp4"];
}
@end
