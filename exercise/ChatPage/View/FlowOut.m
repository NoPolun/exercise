//
//  FlowOut.m
//  exercise
//
//  Created by 哲 on 16/11/19.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "FlowOut.h"

@implementation FlowOut
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.itemSize =CGSizeMake(154, 200);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置各分区上下左右保留的空白区域的大小
        self.sectionInset = UIEdgeInsetsMake(120, 0, 120, 0);
        // 设置单元格之间的最小的行间距
        self.minimumLineSpacing = 50;
        self.minimumInteritemSpacing = 50;
    }
    return self;
}
#pragma mark 该方法返回值决定当UIcollectionView的bounds改变时，时候需要重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

#pragma mark 返回值控制指定CGRect区域内个单元格的大小、位置等布局属性

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array =[super layoutAttributesForElementsInRect:rect];
    //定义一个CGRext，用于记录UIcollectionView的可视区域
    CGRect visibleRect;
    //设置visibleRect的原点等于contentView的偏移
    visibleRect.origin = self.collectionView.contentOffset;
    //设置visibleRect的大小与contentView的大小相同
    visibleRect.size = self.collectionView.bounds.size;
    for (UICollectionViewLayoutAttributes *attributes in array) {
        //用可视区域的中心减去当前单元格控件的中心，得到该单元格与中心的距离
        CGFloat distance = CGRectGetMidX(visibleRect) -attributes.center.x;
        //如果该单元格与中心距离小于指定值，就对该控件进行放大
        if (ABS(distance) < 200) {
            //计算放大比例：该单元格与中心的距离越远，放大比例越小
            CGFloat zoom = 1 + 0.5 * (1 - ABS(distance / 200));
            //设置单元格在x方向、y方向上放大zoom倍
            attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
            attributes.zIndex = 1;
        }
    }
    return array;
}

@end
