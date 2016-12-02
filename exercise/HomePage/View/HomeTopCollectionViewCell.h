//
//  HomeTopCollectionViewCell.h
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeButtonView.h"

@interface HomeTopCollectionViewCell : UICollectionViewCell<SDCycleScrollViewDelegate,buttonClick>
@property(nonatomic,strong)UINavigationController *delegate;
@end
