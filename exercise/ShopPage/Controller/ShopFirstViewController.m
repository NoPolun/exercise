//
//  ShopFirstViewController.m
//  exercise
//
//  Created by 哲 on 16/7/15.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "ShopFirstViewController.h"

@interface ShopFirstViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UILabel *label;
    UITextField *tet;
    UIAlertView *atl;
    UIView * imageViewBack;
    UIWindow *lastWindow;
}

@end

@implementation ShopFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // 设置返回按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithLeftButtonItem:@"返回" color:RGB(0, 0, 0) addTarget:self action:@selector(back)];
    self.view.backgroundColor =[UIColor whiteColor];
    tet =[[UITextField alloc]initWithFrame:CGRectMake(50, 200, 100, 30)];
    [self.view addSubview:tet];
    tet.backgroundColor =[UIColor redColor];
    tet.keyboardType = UIKeyboardTypeDecimalPad;
    tet.delegate =self;
    
    label =[[UILabel alloc]initWithFrame:CGRectMake(20, 300, 200, 20)];
    label.backgroundColor =[UIColor greenColor];
    [self.view addSubview:label];
    label.text = @"实际金额0";
}

-(void)back
{
    
//    图片旋转180度
    /**
     *  /
     *
     *  @param M_PI <#M_PI description#>
     *
     *  @return <#return value description#>
     
     if (flag) {
     [UIView animateWithDuration:0.5 animations:^{
     _imageView.transform = CGAffineTransformMakeRotation(M_PI);
     } completion:^(BOOL finished) {
     flag = NO;
     }];
     }   else {
     [UIView animateWithDuration:0.5 animations:^{
     _imageView.transform = CGAffineTransformMakeRotation(0);
     } completion:^(BOOL finished) {
     flag = YES;
     }];
     }

     */
    NSArray *windows = [[UIApplication sharedApplication] windows];
    lastWindow = (UIWindow *)[windows lastObject];
        self.view.window.windowLevel = lastWindow.windowLevel + 1;
   imageViewBack =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+ 64)];
    imageViewBack.backgroundColor =[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap)];
    [imageViewBack addGestureRecognizer:singleRecognizer];
    [self.view.window  addSubview:imageViewBack];
//    [UIView animateWithDuration:2.0 delay:1.0f options:2 animations:^{
//        
//    } completion:^(BOOL finished) {
    
//        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        UIWindow *lastWindow = (UIWindow *)[windows lastObject];
//        window.windowLevel = lastWindow.windowLevel + 1;
//        
//        UIView *showView = [[UIView alloc] init];
//        showView.backgroundColor = [UIColor blackColor];
//        showView.alpha = 1.0f;
//        showView.layer.cornerRadius = 5.0f;
//        showView.layer.masksToBounds = YES;
//        [window addSubview:showView];
//        
//#pragma mark -文字显示
//        UILabel *textLabel = [[UILabel alloc] init];
//        textLabel.numberOfLines = 0;
//        CGSize Labelsize = [@"这样吧" boundingRectWithSize:CGSizeMake(ScreenWidth, 1000) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12]} context:nil].size;
//        textLabel.text = @"这样吧";
//        textLabel.frame = CGRectMake(10, 5, Labelsize.width, Labelsize.height);
//        textLabel.textColor = [UIColor whiteColor];
//        textLabel.backgroundColor = [UIColor clearColor];
//        textLabel.font = [UIFont boldSystemFontOfSize:12];
//        [showView addSubview:textLabel];
//        
//#pragma mark -提示框的位置
//        showView.frame = CGRectMake((ScreenWidth-Labelsize.width-20)/2, ScreenHeight-60, Labelsize.width+20, Labelsize.height+10);
//        showView.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
//        //设置动画隐藏提示框
////        [UIView animateWithDuration:2 animations:^{
////            showView.alpha = 0;
////        } completion:^(BOOL finished) {
////            [showView removeFromSuperview];
////        }];
//        
//        
//    }];
//    
    
//    atl = [[UIAlertView alloc]initWithTitle:@"fu" message:@"yyy" delegate:self cancelButtonTitle:@"f" otherButtonTitles:@"n", nil];
//    [atl show];
}
-(void)SingleTap
{
    self.view.window.windowLevel = lastWindow.windowLevel -2;

    [imageViewBack removeFromSuperview];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex) {
        
    }
    else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self.navigationController popViewControllerAnimated:YES];
        });
       
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{ NSString *temp;
    
    temp =[textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSLog(@"--%@",temp);
    if ([temp isEqualToString:@""]) {
        temp =@"实际金额0";
    }else{
        temp  = [@"实际金额" stringByAppendingString: temp];
    }
    label.text = temp;
    return YES;
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
