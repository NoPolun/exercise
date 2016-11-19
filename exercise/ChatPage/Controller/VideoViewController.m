//
//  VideoViewController.m
//  exercise
//
//  Created by 哲 on 16/11/19.
//  Copyright © 2016年 XSZ. All rights reserved.
//

#import "VideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayView.h"
@interface VideoViewController ()

@property(nonatomic,strong)AVPlayer *player; // 播放属性
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@property(nonatomic,strong)AVPlayerItem *playerItem; // 播放属性

@property(nonatomic,assign)CGFloat width; // 坐标

@property(nonatomic,assign)CGFloat height; // 坐标

@property(nonatomic,assign)CGPoint startPoint;

@property(nonatomic,assign)CGFloat systemVolume;

@property(nonatomic,strong)UIActivityIndicatorView *activity; // 系统菊花





@property (weak, nonatomic) PlayView *backView;



@end

@implementation VideoViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       self.navigationController.navigationBarHidden = YES;
}
- (void)dealloc

{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:_player.currentItem];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];
    _width = [[UIScreen mainScreen]bounds].size.width;
    _height = [[UIScreen mainScreen]bounds].size.height;
    
    // 创建AVPlayer
    
    self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14468618701471.mp4"]];
    
    self.player = [AVPlayer playerWithPlayerItem:_playerItem];
    
   _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
    
    _playerLayer.frame = CGRectMake(0, 0, _width, _height );
    
    _playerLayer.videoGravity = AVLayerVideoGravityResize;
    
    [self.view.layer addSublayer:_playerLayer];
    
    [_player play];
    
    //AVPlayer播放完成通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:_player.currentItem];
    
  [self.playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];// 监听loadedTimeRanges属性
    
    NSArray *arrayBack =[[NSBundle mainBundle]loadNibNamed:@"PlayView" owner:self options:nil];
    _backView= [arrayBack objectAtIndex:0];
    _backView.frame =CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    _backView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_backView];
    [_backView.slider addTarget:self action:@selector(movieSlider:) forControlEvents:UIControlEventValueChanged];
    [_backView.startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [_backView.backButton addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    _backView.slider.minimumTrackTintColor = [UIColor colorWithRed:30 / 255.0 green:80 / 255.0 blue:100 / 255.0 alpha:1];
    _backView.slider.backgroundColor = [UIColor clearColor];
    _backView.slider.maximumTrackTintColor =[UIColor clearColor];

    [self createGesture];
    self.activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    _activity.center = _backView.center;
    
    [self.view addSubview:_activity];
    
    [_activity startAnimating];
    
      //    //延迟线程
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            _backView.alpha = 0;
            
        }];
        
        
        
    });
    
    
    
    //计时器
    
    [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(Stack) userInfo:nil repeats:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 横屏代码

- (BOOL)shouldAutorotate{
    
    return YES;
    
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
    
    
    switch (interfaceOrientation) {
        case UIInterfaceOrientationPortrait:
            //home健在下
            _playerLayer.frame=CGRectMake(0, 0, _width, _height);
                       break;
        case UIInterfaceOrientationPortraitUpsideDown:
            //home健在上
            _playerLayer.frame=CGRectMake(0, 0, _width, _height);
                       break;
        case UIInterfaceOrientationLandscapeLeft:
            //home健在左
            
            
            _playerLayer.frame=CGRectMake(0, 0, _height, _width);
          
            break;
        case UIInterfaceOrientationLandscapeRight:
            //home健在右
            
            
            _playerLayer.frame=CGRectMake(0, 0, _height, _width);
            
            break;
        default:
            break;
            
            
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    
    
    return UIInterfaceOrientationMaskAll;
    
} //当前viewcontroller支持哪些转屏方向

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    
//    return UIInterfaceOrientationLandscapeRight;
//    
//}


- (BOOL)prefersStatusBarHidden

{
    
    return NO; // 返回NO表示要显示，返回YES将hiden
    
}

#pragma mark -

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context

{
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        
        NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
        
        //        NSLog(@"Time Interval:%f",timeInterval);
        
        CMTime duration = self.playerItem.duration;
        
        CGFloat totalDuration = CMTimeGetSeconds(duration);
        
        [_backView.progress setProgress:timeInterval / totalDuration animated:NO];
        
    }
    
}


- (NSTimeInterval)availableDuration {
    
    NSArray *loadedTimeRanges = [[_player currentItem] loadedTimeRanges];
    
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    
    float startSeconds = CMTimeGetSeconds(timeRange.start);
    
    float durationSeconds = CMTimeGetSeconds(timeRange.duration);
    
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    
    return result;
    
}

- (void)customVideoSlider {
    
    UIGraphicsBeginImageContextWithOptions((CGSize){ 1, 1 }, NO, 0.0f);
    
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    //    [self.slider setMinimumTrackImage:transparentImage forState:UIControlStateNormal];
    
    [_backView.slider setMaximumTrackImage:transparentImage forState:UIControlStateNormal];
    
}











#pragma mark - 计时器事件

- (void)Stack

{
    
    if (_playerItem.duration.timescale != 0) {
        
        
        _backView.slider.maximumValue = 1;//音乐总共时长
        
        _backView.slider.value = CMTimeGetSeconds([_playerItem currentTime]) / (_playerItem.duration.value / _playerItem.duration.timescale);//当前进度
        
        
        
        //当前时长进度progress
        
        NSInteger proMin = (NSInteger)CMTimeGetSeconds([_player currentTime]) / 60;//当前秒
        
        NSInteger proSec = (NSInteger)CMTimeGetSeconds([_player currentTime]) % 60;//当前分钟
    
        
        
        //duration 总时长
        
        
        
        NSInteger durMin = (NSInteger)_playerItem.duration.value / _playerItem.duration.timescale / 60;//总秒
        
        NSInteger durSec = (NSInteger)_playerItem.duration.value / _playerItem.duration.timescale % 60;//总分钟
        
        _backView.timeLable.text = [NSString stringWithFormat:@"%02ld:%02ld / %02ld:%02ld", proMin, proSec, durMin, durSec];
        
    }
    
    if (_player.status == AVPlayerStatusReadyToPlay) {
        
        [_activity stopAnimating];
        
    } else {
        
        [_activity startAnimating];
        
    }
    
    
    
}



#pragma mark - 播放暂停按钮方法

- (void)startAction:(UIButton *)button

{
    
    if (button.selected) {
        
        [_player play];
        
        [button setBackgroundImage:[UIImage imageNamed:@"暂停"] forState:UIControlStateNormal];
        
        
    } else {
        
        [_player pause];
        
        [button setBackgroundImage:[UIImage imageNamed:@"开始"] forState:UIControlStateNormal];
        
        
    }
    
    button.selected =!button.selected;
    
    
    
}




#pragma mark - 创建手势

- (void)createGesture

{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];   
    [self.view addGestureRecognizer:tap];
//
//    
//    
//    
//    
//    
//    
//    //获取系统音量
//    
//    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
//    
//    _volumeViewSlider = nil;
//    
//    for (UIView *view in [volumeView subviews]){
//        
//        if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
//            
//            _volumeViewSlider = (UISlider *)view;
//            
//            break;
//            
//        }
//        
//    }
//    
//    _systemVolume = _volumeViewSlider.value;
    
}

#pragma mark - 轻拍方法

- (void)tapAction:(UITapGestureRecognizer *)tap

{
    
    if (_backView.alpha == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            _backView.alpha = 0;
            
        }];
        
    } else if (_backView.alpha == 0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            
            
            _backView.alpha = 1;
            
        }];
        
    }
    
    if (_backView.alpha == 1) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            
            
            [UIView animateWithDuration:0.5 animations:^{
                
                
                
                _backView.alpha = 0;
                
            }];
            
            
            
        });
        
        
    }
    
}

#pragma mark - 滑动调整音量大小

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event

{
    
    if(event.allTouches.count == 1){
        
        //保存当前触摸的位置
        
        CGPoint point = [[touches anyObject] locationInView:self.view];
        
        _startPoint = point;
        
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
//    if(event.allTouches.count == 1){
//        
//        //计算位移
//        
//        CGPoint point = [[touches anyObject] locationInView:self.view];
//        
//        //        float dx = point.x - startPoint.x;
//        
//        float dy = point.y - _startPoint.y;
//        
//        int index = (int)dy;
//        
//        if(index>0){
//            
//            if(index%5==0){//每10个像素声音减一格
//                
//                NSLog(@"%.2f",_systemVolume);
//                
//                if(_systemVolume>0.1){
//                    
//                    _systemVolume = _systemVolume-0.05;
//                    
//                    [_volumeViewSlider setValue:_systemVolume animated:YES];
//                    
//                    [_volumeViewSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
//                    
//                }
//                
//            }
//            
//        }else{
//            
//            if(index%5==0){//每10个像素声音增加一格
//                
//                NSLog(@"+x ==%d",index);
//                
//                NSLog(@"%.2f",_systemVolume);
//                
//                if(_systemVolume>=0 && _systemVolume<1){
//                    
//                    _systemVolume = _systemVolume+0.05;
//                    
//                    [_volumeViewSlider setValue:_systemVolume animated:YES];
//                    
//                    [_volumeViewSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
//                    
//                }
//                
//            }
//            
//        }
//        
//        //亮度调节
//        
//        //        [UIScreen mainScreen].brightness = (float) dx/self.view.bounds.size.width;
//        
//    }
    
}



-(void)moviePlayDidEnd:(id)sender

{
    
        [_player pause];
    
    
    [self.navigationController popViewControllerAnimated:YES];
 
}












-(void)movieSlider:(UISlider *)sender {
    
    
    //拖动改变视频播放进度
    
    if (_player.status == AVPlayerStatusReadyToPlay) {
        
        
        
        //    //计算出拖动的当前秒数
        
        CGFloat total = (CGFloat)_playerItem.duration.value / _playerItem.duration.timescale;
        
        
        
        //    NSLog(@"%f", total);
        
        
        
        NSInteger dragedSeconds = floorf(total * sender.value);
        
        
        
        //    NSLog(@"dragedSeconds:%ld",dragedSeconds);
        
        
        
        //转换成CMTime才能给player来控制播放进度
        
        
        
        CMTime dragedCMTime = CMTimeMake(dragedSeconds, 1);
        
        
        
        [_player pause];
        
        
        
        [_player seekToTime:dragedCMTime completionHandler:^(BOOL finish){
            
            
            
            [_player play];
            
            
            
        }];
        
        
        
    }

    
    
    
}

//返回上一级
- (void)backButton:(UIButton *)sender {
    
    [_player pause];
    
    [self.navigationController popViewControllerAnimated:YES];

    
}
@end
