//
//  JXScreenSaver.m
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "JXMusicPlayer.h"
#import "JXMusicInfo.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MPNowPlayingInfoCenter.h>

@implementation JXMusicPlayer
+ (instancetype)shareInstance
{
    static JXMusicPlayer *_player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _player = [JXMusicPlayer new];
    });
    return _player;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setting];
    }
    return self;
}

- (void)setting
{
    self.view.hidden = YES;
    self.shouldAutoplay = NO;
    self.controlStyle = MPMovieControlStyleEmbedded;
    
    [self playInBackground];
}

/**
 *  设置当下播放音乐信息
 */
- (void)setNewPlayingInfo:(JXMusicInfo *)musicInfo
{
    Class playingInfoCenter = NSClassFromString(@"MPNowPlayingInfoCenter");
    if (playingInfoCenter) {
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:musicInfo.playingInfo];
    }
}

/**
 *  设置在后台播放音乐
 */
- (void)playInBackground
{
    NSError *error;
    if (![[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error]) {
        NSLog(@"AVAudioSession error %@, %@", error, [error userInfo]);
    } else{
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    }
}

/**
 *  复写父类的方法
 */
- (void)play
{
    // 如果暂停,那么继续播放
    if (_pausing) {
        [super play];
        return;
    }
    
    // 修正数组越界
    if (_currentMusicIndex < 0) {
        _currentMusicIndex = _musicList.count-1;
    }
    if (_currentMusicIndex == _musicList.count) {
        _currentMusicIndex = 0;
    }
    
    // 设置屏幕保护
    [self setNewPlayingInfo:self.currentMusicInfo];
    
    // 设置播放路径
    self.contentURL = self.currentMusicInfo.isLocalResource ?
                        [NSURL fileURLWithPath:self.currentMusicInfo.url] :
                        [NSURL URLWithString:self.currentMusicInfo.url];
    
    // 开始播放
    [super play];
}

/**
 *  上一首
 */
- (void)previousTrack
{
    _currentMusicIndex--;

    _pausing = NO;
    [self play];
}

/**
 *  下一首
 */
- (void)nextTrack
{
    _currentMusicIndex++;
    
    _pausing = NO;
    [self play];
}

/**
 *  暂停
 */
- (void)pause
{
    _pausing = YES;
    [super pause];
}

/**
 *  获取当前音乐信息
 */
- (JXMusicInfo *)currentMusicInfo
{
    return [_musicList objectAtIndex:_currentMusicIndex];
}

@end
