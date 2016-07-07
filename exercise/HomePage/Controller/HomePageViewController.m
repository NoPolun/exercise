//
//  HomePageViewController.m
//  exercise
//
//  Created by 哲 on 16/5/31.
//  Copyright © 2016年 XSZ. All rights reserved.
// 没有进行适配

#import "HomePageViewController.h"
#import "HomeFistViewController.h"
@interface HomePageViewController ()<SDCycleScrollViewDelegate>

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[[UIView alloc] init]];
    CGFloat w = self.view.bounds.size.width;
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"感谢您的支持",
                        @"如果什么需要",
                        @"您可以发邮件到xusizhe@126.com",
                        @"感谢您的支持"
                        ];
    self.title =@"首页";
    self.view.backgroundColor =[UIColor redColor];
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 200) delegate:self placeholderImage:[UIImage imageNamed:@"arrow"]]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    cycleScrollView2.titlesGroup = titles;
    //    cycleScrollView2.showPageControl = NO;
    
    cycleScrollView2.pageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    [self.view addSubview:cycleScrollView2];
    
    //    //             --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    
    

    NSString *str =@"sdasfasfa";
    CGFloat number =[str getStringWidthFontSize:14];

    // 清除缓存
    //    [cycleScrollView2 clearCache];
    
    
    
}






#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HomeFistViewController *home =[[HomeFistViewController alloc]init];
    [self.navigationController pushViewController:home animated:YES];
    NSLog(@"---点击了第%ld张图片", index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
