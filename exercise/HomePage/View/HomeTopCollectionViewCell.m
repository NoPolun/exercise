//
//  HomeTopCollectionViewCell.m
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "HomeTopCollectionViewCell.h"
#import "HomeFistViewController.h"
@implementation HomeTopCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    
    
    self =[super initWithFrame:frame];
    if (self) {

//        [self.view addSubview:[[UIView alloc] init]];
        self.contentView.backgroundColor =[UIColor greenColor];
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

        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, HIGHSCALE(ScreenWidth, 160)) delegate:self placeholderImage:[UIImage imageNamed:@"arrow"]]; // 模拟网络延时情景
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.delegate = self;
        cycleScrollView2.titlesGroup = titles;
        //    cycleScrollView2.showPageControl = NO;
        
        cycleScrollView2.pageDotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
        [self.contentView addSubview:cycleScrollView2];
        
        //    //             --- 模拟加载延迟
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
        });
    
        NSDictionary *dic =@{
                             @"arrayButton":@[@{@"image":@"任务",@"title":@"许思哲"},@{@"image":@"任务",@"title":@"男"},@{@"image":@"任务",@"title":@"身高"},@{@"image":@"任务",@"title":@"体重"},@{@"image":@"任务",@"title":@"足球"},@{@"image":@"任务",@"title":@"动漫"},@{@"image":@"任务",@"title":@"看书"},@{@"image":@"任务",@"title":@"专研技术"}],
                                @"width":@44,
                                @"high":@44,
                                @"font":@14
                             };
        HomeButtonView *homebutton =[[HomeButtonView alloc]init];
        [self.contentView addSubview:homebutton];
        homebutton.frame =CGRectMake(0, HIGHSCALE(ScreenWidth, 160), ScreenWidth, HIGHSCALE(ScreenWidth, 180));
        homebutton.delegate =self;
        [homebutton dictionary:dic ];    }
    return self;
}
-(void)getButtonClickTag:(NSInteger)tag
{
    NSLog(@"点击这里有反映了。。%ld",tag);
    NSArray *array =@[@"HomePageViewController",@"ShopingPageViewController",@"ChatPageViewController",@"MapPageViewController",@"HomePageViewController",@"ShopingPageViewController",@"ChatPageViewController",@"MapPageViewController"];
    
    UIViewController *vc =[NSClassFromString(array[tag]) new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.delegate pushViewController:vc animated:YES];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HomeFistViewController *home =[[HomeFistViewController alloc]init];
    home.hidesBottomBarWhenPushed = YES;
    [self.delegate pushViewController:home animated:YES];
    NSLog(@"---点击了第%ld张图片", index);
}


@end
