//
//  SZView.h
//  exercise
//
//  Created by 哲 on 16/11/24.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
///九宫格图片间隔
#define kJGG_GAP 5
/**
 *
 *  @param index      点击index
 *  @param dataSource 数据源
 */
typedef void (^TapBlcok)(NSInteger index,NSArray *dataSource,NSIndexPath *indexpath);
@interface SZView : UIView
/**
 *  九宫格显示的数据源，dataSource中可以放UIImage对象和NSString(http://sjfjfd.cjf.jpg)，还有NSURL也可以
 */
@property (nonatomic, retain)NSArray * dataSource;
/**
 *  TapBlcok
 */
@property (nonatomic, copy)TapBlcok  tapBlock;
/**
 *  TapBlcok
 */
@property (nonatomic, copy)NSIndexPath  *indexpath;
/**
 *  Description 九宫格
 *
 *  @param frame      frame
 *  @param dataSource 数据源
 *  @param tapBlock tapBlock点击的block
 *  @return JGGView对象
 */
- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource completeBlock:(TapBlcok )tapBlock;


/**
 *  Description 九宫格
 *
 *  @param dataSource 数据源
 *  @param tapBlock tapBlock点击的block
 *  @return JGGView对象
 */
-(void)JGGView:(SZView *)jggView DataSource:(NSArray *)dataSource completeBlock:(TapBlcok)tapBlock;

/**
 *  配置图片的宽（正方形，宽高一样）
 *
 *  @return 宽
 */
+(CGFloat)imageWidth;
/**
 *  配置图片的高（正方形，宽高一样）
 *
 *  @return 高
 */
+(CGFloat)imageHeight;
@end
