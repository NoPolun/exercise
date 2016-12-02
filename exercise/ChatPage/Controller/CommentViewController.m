//
//  CommentViewController.m
//  exercise
//
//  Created by 哲 on 16/11/19.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "CommentViewController.h"
//展示的cell
#import "MessageCell.h"
//数据源
#import "MessageModel.h"
@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSoure;//数据源
//@property(nonatomic,strong)
@end

@implementation CommentViewController
-(instancetype)init
{
    self = [super init];
    if(self){
        //注册键盘出现NSNotification
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        //注册键盘隐藏NSNotification
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  self.title = @"朋友圈";
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];

    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"cell";
    MessageCell *cell =[tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        cell =[[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
      UIWindow *window = [UIApplication sharedApplication].keyWindow;
    __weak typeof (self) weakSelf =self;
    __weak typeof (_tableView) weakTable =_tableView;
    __weak typeof (window) weakWindow =window;
    //获取数据
    __block MessageModel *model =[self.dataSoure objectAtIndex:indexPath.row];
    //为cell赋值
    [cell configCellWithModel:model indexPath:indexPath];
    cell.backgroundColor =[UIColor whiteColor];
    //评论
    cell.CommentBtnClickBlock = ^(UIButton *commentBtn,NSIndexPath * indexPath)
    {
        
        //不是点击cell进行回复，则置空replayTheSeletedCellModel，因为这个时候是点击评论按钮进行评论，不是回复某某某
        self.replayTheSeletedCellModel = nil;
        weakSelf.seletedCellHeight = 0.0;
        weakSelf.needUpdateOffset = YES;
        weakSelf.chatKeyBoard.placeHolder = [NSString stringWithFormat:@"评论 %@",model.userName];
        weakSelf.history_Y_offset = [commentBtn convertRect:commentBtn.bounds toView:weakWindow].origin.y;
        weakSelf.currentIndexPath = indexPath;
        [weakSelf.chatKeyBoard keyboardUpforComment];
    };
    //更多
    cell.MoreBtnClickBlock = ^(UIButton *moreBtn,NSIndexPath * indexPath)
    {
        [weakSelf.chatKeyBoard keyboardDownForComment];
        weakSelf.chatKeyBoard.placeHolder = nil;
        model.isExpand = !model.isExpand;
        model.shouldUpdateCache = YES;
        [weakTable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    
    //点击九宫格
    cell.tapImageBlock = ^(NSInteger index,NSArray *dataSource,NSIndexPath *indexpath){
        [weakSelf.chatKeyBoard keyboardDownForComment];
    };
    
    //点击文字
    cell.TapTextBlock=^(UILabel *desLabel){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:desLabel.text delegate:weakSelf cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    };

  
    return cell;

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel *messageModel = [self.dataSource objectAtIndex:indexPath.row];
    CGFloat h = [MessageCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        MessageCell *cell = (MessageCell *)sourceCell;
        [cell configCellWithModel:messageModel indexPath:indexPath];
    } cache:^NSDictionary *{
        NSDictionary *cache = @{kHYBCacheUniqueKey : messageModel.cid,
                                kHYBCacheStateKey  : @"",
                                kHYBRecalculateForStateKey : @(messageModel.shouldUpdateCache)};
        messageModel.shouldUpdateCache = NO;
        return cache;
    }];
    return h;
}


#pragma mark - passCellHeightWithModel

- (void)passCellHeightWithMessageModel:(MessageModel *)messageModel commentModel:(CommentModel *)commentModel atCommentIndexPath:(NSIndexPath *)commentIndexPath cellHeight:(CGFloat )cellHeight commentCell:(CommentCell *)commentCell messageCell:(MessageCell *)messageCell{
    self.needUpdateOffset = YES;
    self.replayTheSeletedCellModel = commentModel;
    self.currentIndexPath = [self.tableView indexPathForCell:messageCell];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.chatKeyBoard.placeHolder = [NSString stringWithFormat:@"回复 %@",commentModel.commentUserName];
    self.history_Y_offset = [commentCell.contentLabel convertRect:commentCell.contentLabel.bounds toView:window].origin.y;
    self.seletedCellHeight = cellHeight;
    [self.chatKeyBoard keyboardUpforComment];
}
- (void)reloadCellHeightForModel:(MessageModel *)model atIndexPath:(NSIndexPath *)indexPath{
    model.shouldUpdateCache = YES;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}
#pragma mark
#pragma mark keyboardWillShow
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    __block  CGFloat keyboardHeight = [aValue CGRectValue].size.height;
    if (keyboardHeight==0) {//解决搜狗输入法三次调用此方法的bug、
        //        IOS8.0之后可以安装第三方键盘，如搜狗输入法之类的。
        //        获得的高度都为0.这是因为键盘弹出的方法:- (void)keyBoardWillShow:(NSNotification *)notification需要执行三次,你如果打印一下,你会发现键盘高度为:第一次:0;第二次:216:第三次:282.并不是获取不到高度,而是第三次才获取真正的高度.
        return;
    }
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    CGFloat keyboardTop = keyboardRect.origin.y;
    CGRect newTextViewFrame = self.view.bounds;
    newTextViewFrame.size.height = keyboardTop - self.view.bounds.origin.y;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    CGFloat delta = 0.0;
    if (self.seletedCellHeight){//点击某行，进行回复某人
        delta = self.history_Y_offset - ([UIApplication sharedApplication].keyWindow.bounds.size.height - keyboardHeight-self.seletedCellHeight-kChatToolBarHeight);
    }else{//点击评论按钮
        delta = self.history_Y_offset - ([UIApplication sharedApplication].keyWindow.bounds.size.height - keyboardHeight-kChatToolBarHeight-24-10);//24为评论按钮高度，10为评论按钮上部的5加评论按钮下部的5
    }
    CGPoint offset = self.tableView.contentOffset;
    offset.y += delta;
    if (offset.y < 0) {
        offset.y = 0;
    }
    if (self.needUpdateOffset) {
        [self.tableView setContentOffset:offset animated:YES];
    }
}
#pragma mark
#pragma mark keyboardWillHide
- (void)keyboardWillHide:(NSNotification *)notification {
    //    NSValue *animationDurationValue = [notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    //    NSTimeInterval animationDuration;
    //    [animationDurationValue getValue:&animationDuration];
    //    [UIView animateWithDuration:animationDuration animations:^{
    //    }];
    self.needUpdateOffset = NO;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.chatKeyBoard keyboardDownForComment];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.chatKeyBoard keyboardDownForComment];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"CommentViewController dealloc");
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
