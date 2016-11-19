//
//  ShopingPageViewController.m
//  exercise
//
//  Created by 哲 on 16/5/31.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "ShopingPageViewController.h"
#import "ShopFirstViewController.h"
@interface ShopingPageViewController ()

@end

@implementation ShopingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"购物";
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(50, 50, 100, 100);
    button.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(ss) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor =[UIColor greenColor];
   

}
-(void)ss
{
    ShopFirstViewController *shop =[[ShopFirstViewController alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
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
