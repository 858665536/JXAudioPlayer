//
//  JXScreenSaver.h
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@class JXMusicInfo;
@interface JXMusicPlayer : MPMoviePlayerController
{
    BOOL _pausing;
}
/**
 *  单例
 */
+ (instancetype)shareInstance;

/**
 *  音乐列表
 */
@property (nonatomic, strong) NSMutableArray *musicList;

/**
 *  当前播放音乐的信息
 */
@property (nonatomic, strong, readonly) JXMusicInfo *currentMusicInfo;

/**
 *  当前播放音乐的索引
 */
@property (nonatomic, assign, readonly) NSInteger currentMusicIndex;


/**
 *  播放音乐
 */
- (void)play;

/**
 *  上一首
 */
- (void)previousTrack;

/**
 *  下一首
 */
- (void)nextTrack;

/**
 *  暂停
 */
- (void)pause;

@end
