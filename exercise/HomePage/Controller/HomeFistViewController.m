//
//  HomeFistViewController.m
//  exercise
//
//  Created by 哲 on 16/7/7.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "HomeFistViewController.h"

@interface HomeFistViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation HomeFistViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.webView];
    self.webView.delegate =self;
    NSURL*url = [NSURL URLWithString:@"http://www.xianhua.cn/m/"];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
   
    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *str = @"document.getElementsByClassName('detail_btns2')[0].remove();";
    [webView stringByEvaluatingJavaScriptFromString:str];
    NSString *str1 = @"document.getElementsByTagName('h1')[0].innerText='思哲鲜花网'";
    [webView stringByEvaluatingJavaScriptFromString:str1];
    NSString *str2 =@"document.getElementById('xiazaiapp').getElementsByTagName('a')[0].innerText = '下载思哲app'";
    [webView stringByEvaluatingJavaScriptFromString:str2];
     self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
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
