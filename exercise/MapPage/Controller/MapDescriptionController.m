//
//  MapDescriptionController.m
//  exercise
//
//  Created by 哲 on 16/7/11.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "MapDescriptionController.h"
#import "LocateVieController.h"
#import "MapCompileViewController.h"
#import "MapMakeViewController.h"
@interface MapDescriptionController()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrayName;
    NSArray *didArray;
}

@property(nonatomic,strong)UITableView *tableViewMap;
@end
@implementation MapDescriptionController
- (void)dealloc
{
    _tableViewMap.dataSource = nil;
    _tableViewMap.delegate = nil;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    arrayName =@[@"获取定位信息",@"地图详情",@"输入地址定位"];
    didArray = @[@"LocateVieController",@"MapCompileViewController",@"MapMakeViewController"];
    
    
    
    [self creatTableView];
    
    
    
    
    
}
-(void)creatTableView
{
    _tableViewMap =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewMap];
    _tableViewMap.delegate = self;
    _tableViewMap.dataSource = self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str]
        ;
    }
    cell.textLabel.text =arrayName[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc =[NSClassFromString(didArray[indexPath.row]) new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
