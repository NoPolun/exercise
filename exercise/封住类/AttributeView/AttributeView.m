//
//  AttributeCollectionView.m
//  天巢新1期
//
//  Created by 唐建平 on 15/12/15.
//  Copyright © 2015年 JP. All rights reserved.
//

#import "AttributeView.h"
#import "UIView+Extnesion.h"
#import "UIButton+EnlargeEdge.h"

#define AppColor  Color(245, 58, 64)

#define margin 15
// 屏幕的宽
#define JPScreenW [UIScreen mainScreen].bounds.size.width
// 屏幕的高
#define JPScreenH [UIScreen mainScreen].bounds.size.height
//RGB
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface AttributeView ()

@property (nonatomic ,weak) UIButton *btn;
@end

@implementation AttributeView

/**
 *  返回一个创建好的属性视图,并且带有标题.创建好之后必须设置视图的Y值.
 *
 *  @param texts 属性数组
 *
 *  @param viewWidth 视图宽度
 *
 *  @return attributeView
 */
+ (AttributeView *)attributeViewWithTitle:(NSString *)title titleFont:(UIFont *)font attributeTexts:(NSArray *)texts viewWidth:(CGFloat)viewWidth{
    int count = 0;
    float btnW = 0;
    AttributeView *view = [[AttributeView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i<texts.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        [btn addTarget:view action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        NSString *str = texts[i];
        [btn setTitle:str forState:UIControlStateNormal];
        CGSize strsize = [str sizeWithFont:[UIFont systemFontOfSize:14]];
        
        btn.width = strsize.width;
        btn.height = margin;
        
        if (i == 0) {
            btn.x = 0;
            btnW += CGRectGetMaxX(btn.frame);
        }
        else{
            btnW += CGRectGetMaxX(btn.frame)+margin;
            if (btnW > viewWidth) {
                count++;
                btn.x = 0;
                btnW = CGRectGetMaxX(btn.frame);
            }
            else{
                
                btn.x += btnW - btn.width;
                
            }
        }
        btn.userInteractionEnabled = YES;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [btn setTitleColor:Color_12 forState:UIControlStateNormal];
//        [btn setTitleColor:gao_Color_10 forState:UIControlStateSelected];
        btn.y += count * (btn.height + 10);
        
        
        btn.tag = i;
        [view addSubview:btn];
        if (i == texts.count - 1) {
            view.height = CGRectGetMaxY(btn.frame) + 10;
            view.x = 0;
            view.width = viewWidth;
        }
    }
    return view;
}

- (void)btnClick:(UIButton *)sender{
    if (![self.btn isEqual:sender]) {
        self.btn.selected = NO;
    }
    sender.selected = YES;
    self.btn = sender;
    if ([self.Attribute_delegate respondsToSelector:@selector(Attribute_View:didClickBtnAtBtnTag:)]) {
        [self.Attribute_delegate Attribute_View:self didClickBtnAtBtnTag:sender.tag];
    }
}

@end
