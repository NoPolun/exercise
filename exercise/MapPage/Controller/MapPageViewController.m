//
//  MapPageViewController.m
//  exercise
//
//  Created by 哲 on 16/5/31.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "MapPageViewController.h"

@interface MapPageViewController ()
{
    NSArray *arra;
    NSArray *array;
}
@property(nonatomic,strong)UITableView *tableViewMap;
@end

@implementation MapPageViewController
- (void)dealloc
{
    _tableViewMap.delegate = nil;
    _tableViewMap.dataSource = nil;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"地图";
    arra  = @[@"地图",@"CALayer",@"CATransition",@"属性动画",@"其他",@"获取视频截图作为图片"];
    self.view.backgroundColor =[UIColor whiteColor];
    array =@[@"MapDescriptionController",
             @"CLayerViewController",
             @"CATransitionViewController",
             @"AttributeViewController",
             @"OtherAaimeViewController"];
    [self creatTableView];
    
}
-(void)creatTableView
{
    _tableViewMap =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewMap];
    _tableViewMap.backgroundColor =RGB(242, 242, 242);
    _tableViewMap.dataSource = self;
    _tableViewMap.delegate = self;
    _tableViewMap.tableFooterView =[[UIView alloc]init];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    
    }
    
    cell.textLabel.text = arra[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc =[NSClassFromString(array[indexPath.row]) new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];

    
    
    
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
