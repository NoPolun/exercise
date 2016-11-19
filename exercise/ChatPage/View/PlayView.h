//
//  PlayView.h
//  exercise
//
//  Created by 哲 on 16/11/19.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayView : UIView

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;

@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@property (weak, nonatomic) IBOutlet UISlider *slider;







@end
