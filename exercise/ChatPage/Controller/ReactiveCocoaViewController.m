//
//  ReactiveCocoaViewController.m
//  exercise
//
//  Created by 哲 on 16/12/3.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import "ReactiveView.h"
#import <NSObject+RACKVOWrapper.h>
@interface ReactiveCocoaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UIButton *btnClick;

@property (weak, nonatomic) IBOutlet ReactiveView *reactview;

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //代替代理 (不需要传值)
    [[_reactview rac_signalForSelector:@selector(btnClick:)] subscribeNext:^(id x) {
        NSLog(@"点击了reactive中的btn");
    }];
     //代替代理 (传值)
    [_reactview.subjectClick subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    //KVO
//    [_reactview rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
//        NSLog(@"发生了改变");
//       }];
    [[_reactview rac_valuesForKeyPath:@"frame" observer:nil]subscribeNext:^(id x) {
        NSLog(@"发生了改变");
    }];
    //监听事件
    [[_btnClick rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        NSLog(@"点击了按钮");
    }];
    
    //代替通知
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:@"" object:nil]subscribeNext:^(id x) {
        
    }];
    
    
    
    //监听文本
    [_account.rac_textSignal subscribeNext:^(id x) {
        
    }];
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
- (IBAction)btnClick:(UIButton *)sender {
}



@end
