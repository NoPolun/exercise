//
//  UIButton+EnlargeEdge.h
//  MobileUU
//
//  Created by UTOUU on 16/1/21.
//  Copyright © 2016年 Shanghai Pecker Network Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
