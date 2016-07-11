//
//  HomeButtonView.h
//  exercise
//
//  Created by 哲 on 16/7/8.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"

@protocol  buttonClick<NSObject>
-(void)getButtonClickTag:(NSInteger)tag;
@end


@interface HomeButtonView : UIView
//typedef void(^MyClickback)(NSInteger obj);
@property(nonatomic,weak)id <buttonClick>delegate;
-(void)dictionary:(NSDictionary *)diction ;
-(void)array:(NSArray *)array;
@end
