//
//  MapMakeViewController.m
//  exercise
//
//  Created by 哲 on 16/7/12.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "MapMakeViewController.h"
@interface MapMakeViewController()<MKMapViewDelegate,UISearchBarDelegate>
@property(nonatomic,strong)MKMapView *mapView;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)CLGeocoder *geocoder;//地址解析
@end
@implementation MapMakeViewController
- (void)dealloc
{
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar =[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    self.navigationItem.titleView = self.searchBar;
    self.geocoder =[[CLGeocoder alloc]init];
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
//    self.mapView.showsUserLocation = YES;
    //    设置标注
    self.mapView.delegate = self;
    [self.view addSubview:_mapView];
    self.mapView.backgroundColor =RGB(255, 255, 255);
//    self.searchBar.text = @"洋宏大厦";
    self.searchBar.delegate = self;
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self doSearch:searchBar];
}

-(void)doSearch:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    NSString *string =self.searchBar.text;
    if (string != nil && string.length > 0) {
        [self loacateAt:string];
    }
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
//    通过遍历找到该搜素框的“取消按钮”,并将"取消"按钮的文本设为“搜索”
    for (id cc in [searchBar.subviews[0] subviews]) {
        if ([cc isKindOfClass:[UIButton class]]) {
            UIButton *button =(UIButton *)cc;
            [button setTitle:@"搜索" forState:UIControlStateNormal];
        }
    }
}
//将字符串地址转化成经度，纬度信息，执行定位
-(void)loacateAt:(NSString *)address
{
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0 && error == nil) {
            NSLog(@"%ld",placemarks.count);
//            处理第一个地址
            CLPlacemark *placemark= [placemarks objectAtIndex:0];
            
            NSLog(@"经度 = : %f",placemark.location.coordinate.longitude);
            NSLog(@"纬度 = : %f",placemark.location.coordinate.latitude);
            NSLog(@"国家 = %@",placemark.country);
            NSLog(@"邮编 = %@",placemark.postalCode);
            NSLog(@"位置 = %@",placemark.locality);
            // 设置地图的显示范围
            MKCoordinateSpan span;
            // 地图显示范围越小，细节越清楚
            span.latitudeDelta = 0.01;
            span.longitudeDelta = 0.01;
            MKCoordinateRegion region = {placemark.location.coordinate,span};
            // 设置地图的中心位置为搜索到的位置
            [self.mapView setRegion:region];
            // MKPointAnnotation作为地图锚点
            MKPointAnnotation *point =[[MKPointAnnotation alloc]init];
            // 设置锚点坐标
            point.coordinate = placemark.location.coordinate;
            // 设置锚点的标题
            point.title = placemark.name;
            // 设置锚点的副标题
            point.subtitle = [NSString stringWithFormat:@"%@-%@-%@-%@",placemark.country,placemark.administrativeArea,placemark.locality,placemark.subLocality];
             // 将地图锚点添加到地图
            [self.mapView addAnnotation:point];
            //  选中指定锚点
            [self.mapView selectAnnotation:point animated:YES];
            
            
        }else{
            NSLog(@"没有匹配的信息");
        }
        
        
        
        
        
        
        
    }];
}
@end
