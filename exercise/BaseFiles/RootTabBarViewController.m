//
//  RootTabBarViewController.m
//  exercise
//
//  Created by 哲 on 16/11/19.
//  Copyright © 2016年 XSZ. All rights reserved.
//
#import "SZBasenavigationController.h"
#import "RootTabBarViewController.h"
#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"HomeViewController",
                                   kTitleKey  : @"第一页",
                                   kImgKey    : @"tabbar_mainframe",
                                   kSelImgKey : @"tabbar_mainframeHL"},
                                 
                                 @{kClassKey  : @"ContactsViewController",
                                   kTitleKey  : @"第二页",
                                   kImgKey    : @"tabbar_contacts",
                                   kSelImgKey : @"tabbar_contactsHL"},
                                 
                                 @{kClassKey  : @"DiscoverViewController",
                                   kTitleKey  : @"第三页",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                                 
                                 @{kClassKey  : @"MeViewController",
                                   kTitleKey  : @"第四页",
                                   kImgKey    : @"tabbar_me",
                                   kSelImgKey : @"tabbar_meHL"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        SZBasenavigationController *nav = [[SZBasenavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : RGB(0, 190, 12)} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 0;
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
