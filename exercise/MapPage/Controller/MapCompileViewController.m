//
//  MapCompileViewController.m
//  exercise
//
//  Created by 哲 on 16/7/16.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "MapCompileViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapCompileViewController()<MKMapViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)MKMapView *mapView;
@end
@implementation MapCompileViewController
- (void)dealloc
{
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    //    设置地图的风格，此处设置为标准风格
    self.mapView.mapType = MKMapTypeStandard;
    //    设置地图可缩放
    self.mapView.zoomEnabled = YES;
    //    设置地图可以滚动
    self.mapView.scrollEnabled = YES;
    //    设置地图可以旋转
    self.mapView.rotateEnabled = YES;
    //    设置显示用户当前位置
    self.mapView.showsUserLocation = YES;
//    设置标注
    self.mapView.delegate = self;
    self.mapView.backgroundColor =RGB(255, 255, 255);
    self.navigationController.navigationBarHidden = YES;
    //    调用自己的位置用来显示位置和显示区域
        [self.view addSubview:_mapView];
    
    //    设置定位管理
    self.locationManager =[[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    //    设置定位精度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //    设置距离过滤器为50米，每移动50米更新一次位置
    self.locationManager.distanceFilter = 50;
    //    开始监听定位信息
    [self.locationManager startUpdatingLocation];

    
    
    
    
   
    
}
//地图显示和中心位置
-(void)locationtoLatitude:(double)latitude longitude:(double)longitude
{
    CLLocationCoordinate2D center ={latitude,longitude};
    center.longitude = longitude;
    center.latitude = latitude;
//    设置地图显示范围
    MKCoordinateSpan span;
    span.latitudeDelta = 0.1;
    span.longitudeDelta = 0.1;
//    创建MKCoordinateRegion,该对象代表地图中心和地图范围
    MKCoordinateRegion region = {center,span};
//    设置当前地图显示中心和显示范围
    [self.mapView setRegion:region animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //    获取最后一个定位信息
    CLLocation *loaction =[locations lastObject];
    NSLog(@"经度%g",loaction.coordinate.latitude);
    NSLog(@"纬度%g",loaction.coordinate.longitude);
    NSLog(@"高度%g",loaction.altitude);
    NSLog(@"速度%g",loaction.speed);
    NSLog(@"方向%g",loaction.course);
    [self locationtoLatitude:loaction.coordinate.latitude longitude:loaction.coordinate.longitude];
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"定位失败:%@",error);
}
//当显示区域将要发生变化时激发此方法
-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    
}
//当开始加载数据的时候激活此方法
-(void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    
}
//当显示区域发生变化完成时激发此方法
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}
//当显示区域加载数据完成时激发此方法
-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    
}
//当显示区域加载失败的时候激发此方法
-(void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    
}
//当开始渲染地图的时候激发此方法
-(void)mapViewWillStartRenderingMap:(MKMapView *)mapView
{
    
}
//当渲染地图完成时激发此方法
-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    
}
@end
