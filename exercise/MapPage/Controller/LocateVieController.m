//
//  LocateVieController.m
//  exercise
//
//  Created by 哲 on 16/7/12.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "LocateVieController.h"
#import <CoreLocation/CoreLocation.h>
#import "HomeButtonView.h"
@interface LocateVieController()<CLLocationManagerDelegate,buttonClick>
@property(nonatomic,strong)CLLocationManager *locationManager;
@end
@implementation LocateVieController
- (void)dealloc
{
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager =[[CLLocationManager alloc]init];
    self.locationManager.delegate = self;

    HomeButtonView *home =[[HomeButtonView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 100, ScreenWidth, 50)];
    
    [self.view addSubview:home];
    home.delegate = self;
    [home array:@[@"定位",@"车速",@"区域范围"]];
    
}
-(void)getButtonClickTag:(NSInteger)tag
{
      //    定位是否可用
    if ([CLLocationManager locationServicesEnabled]) {

    switch (tag) {
        case 0:
            [self locate];
            break;
        case 1:
            [self speed];
            break;
        case 2:
            [self range];
            break;
            
        default:
            break;
    }
    }else{
         NSLog(@"无法定位");
    }
}
//定位
-(void)locate
{
    
    
        //    设置定位精度
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //    设置距离过滤器为50米，每移动50米更新一次位置
        self.locationManager.distanceFilter = 50;
        //    开始监听定位信息
        [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [self.locationManager requestWhenInUseAuthorization];     //NSLocationWhenInUseDescription
                [self.locationManager requestAlwaysAuthorization];
            }
            break;
        default:
            break;
    }
}


//成功获取定位信息后将调用这个方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //    获取最后一个定位信息
    CLLocation *loaction =[locations lastObject];
    NSLog(@"经度%g",loaction.coordinate.latitude);
      NSLog(@"纬度%g",loaction.coordinate.longitude);
      NSLog(@"高度%g",loaction.altitude);
      NSLog(@"速度%g",loaction.speed);
      NSLog(@"方向%g",loaction.course);
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败:%@",error);
}

//车速
-(void)speed
{
    
}
//范围
-(void)range
{
    //    定义一个CLLocationCoordinate2D作用的区域中心
    CLLocationCoordinate2D compamuCenter;
    compamuCenter.latitude = 31.0688;
    compamuCenter.longitude = 121.493;
    //    使用CLCircularRegion定义一个圆形区域
    CLRegion *fkit = [[CLCircularRegion alloc]initWithCenter:compamuCenter radius:500 identifier:@"fkit"];
    //    开始监听区域
    [self.locationManager startMonitoringForRegion:fkit];
    
}
//进入指定区域进行提示
-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    [[[UIAlertView alloc]initWithTitle:@"区域检测" message:@"进入区域" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
}
//出了指定区域进行提示
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
        [[[UIAlertView alloc]initWithTitle:@"区域检测" message:@"走出区域" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
}
@end
