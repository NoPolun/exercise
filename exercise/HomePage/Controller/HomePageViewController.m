//
//  HomePageViewController.m
//  exercise
//
//  Created by 哲 on 16/5/31.
//  Copyright © 2016年 XSZ. All rights reserved.
// 没有进行适配

#import "HomePageViewController.h"
#import "HomeFistViewController.h"
#import "HomeTopCollectionViewCell.h"
@interface HomePageViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *szCollectionView;
@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"首页";
    [self creatCollectionView];
    [self creatNavigation];
    
}
-(void)creatNavigation
{
    /**
     此处设置左右导航栏
     
     :returns: 点击事件进行跳转
     */
    UIBarButtonItem *dd =[UIBarButtonItem initWithLeftButtonItem:@"任务" selectImage:@"任务" addTarget:self action:@selector(ssd)];
    UIBarButtonItem *cc =[[UIBarButtonItem alloc]init];
    cc.width = -20;
    UIBarButtonItem *aa =[UIBarButtonItem initWithLeftButtonItem:@"IconiPhoneSpootlight5_29pt" selectImage:@"IconiPhoneSpootlight5_29pt" addTarget:self action:@selector(ssd)];
    UIBarButtonItem *bb =[[UIBarButtonItem alloc]init];
    bb.width = -20;
    self.navigationItem.leftBarButtonItems = @[bb,aa];
    self.navigationItem.rightBarButtonItems =@[cc,dd];
    
}
-(void)ssd
{
  
    
    NSLog(@"点击右侧的图片");
}

-(void)creatCollectionView
{
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _szCollectionView  = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _szCollectionView.dataSource = self;
    _szCollectionView.delegate= self;
    _szCollectionView.showsVerticalScrollIndicator = NO;
    _szCollectionView.showsHorizontalScrollIndicator = NO;
    [_szCollectionView registerClass:[HomeTopCollectionViewCell class] forCellWithReuseIdentifier:@"topCell"];
    _szCollectionView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_szCollectionView];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
          return CGSizeMake(ScreenWidth,HIGHSCALE(ScreenWidth, 400));
            break;
        default:
            return CGSizeMake(ScreenWidth, 34);
            break;
    }
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{ static NSString *indentifier = @"topCell";
    //    switch (indexPath.section) {
    //        case 0:
    //        {
    HomeTopCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    cell.delegate = self.navigationController;
    return cell;
    //        }
    //            break;
    //
    //        default:
    //            break;
    //    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return CGSizeMake(ScreenWidth, 0);
        
    }
    
    return CGSizeMake(ScreenWidth, 5);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
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
