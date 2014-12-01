//
//  UIApplication+JXMusic.m
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "UIApplication+JXMusic.h"
#import "JXMusicPlayer.h"

@implementation UIApplication (JXMusic)
- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPause:
                [[JXMusicPlayer shareInstance] pause];
                break;
            
            case UIEventSubtypeRemoteControlPlay:
                [[JXMusicPlayer shareInstance] play];
                break;
                
            case UIEventSubtypeRemoteControlPreviousTrack:
                [[JXMusicPlayer shareInstance] previousTrack];
                break;
                
            case UIEventSubtypeRemoteControlNextTrack:
                [[JXMusicPlayer shareInstance] nextTrack];
                break;
                
            default:
                break;
        }
    }
}
@end
