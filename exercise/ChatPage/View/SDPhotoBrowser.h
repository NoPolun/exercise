//
//  SDPhotoBrowser.h
//  exercise
//
//  Created by 哲 on 16/11/24.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SDButton, SDPhotoBrowser;

@protocol SDPhotoBrowserDelegate <NSObject>

@required

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;

@optional

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

@end
@interface SDPhotoBrowser : UIView<UIScrollViewDelegate>
@property (nonatomic, weak) UIView *sourceImagesContainerView;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<SDPhotoBrowserDelegate> delegate;

- (void)show;
@end
