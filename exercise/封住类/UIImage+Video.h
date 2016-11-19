//
//  UIImage+Video.h
//  exercise
//
//  Created by 哲 on 16/7/12.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface UIImage (Video)
+(UIImage *)imageWithVideo:(NSString *)stringURL;
+(UIImage*) createImageWithColor: (UIColor*) color;
@end
