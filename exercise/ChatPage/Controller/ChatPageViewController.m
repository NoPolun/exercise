//
//  ChatPageViewController.m
//  exercise
//
//  Created by 哲 on 16/5/31.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "ChatPageViewController.h"
#import "VideoViewController.h"
#import "CommentViewController.h"
#import "EffectFirstCollectionViewController.h"
#import "UINavigationBar+SZdeleteLine.h"
#import "ReactiveCocoaViewController.h"
@interface ChatPageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arra;
    NSArray *array;
}
@property(nonatomic,strong)UITableView *tableViewChat;
@end

@implementation ChatPageViewController

- (void)dealloc
{
    _tableViewChat.delegate = nil;
    _tableViewChat.dataSource = nil;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UINavigationBar setDeleteNavLine:self.navigationController.navigationBar color:RGB(255, 255, 255)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"评论视频";
    arra  = @[@"评论",@"视频",@"collectionView效果设计1",@"ReactiveCocoa"];
    self.view.backgroundColor =[UIColor whiteColor];
    array =@[@"CommentViewController",
             @"VideoViewController",
             @"EffectFirstCollectionViewController",@"ReactiveCocoaViewController"];
    [self creatTableView];
    
}
-(void)creatTableView
{
    _tableViewChat =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewChat];
    _tableViewChat.backgroundColor =RGB(242, 242, 242);
    _tableViewChat.dataSource = self;
    _tableViewChat.delegate = self;
    _tableViewChat.tableFooterView =[[UIView alloc]init];
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
    return  arra.count;
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
