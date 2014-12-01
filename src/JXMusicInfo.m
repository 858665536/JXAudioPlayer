//
//  JXMusicItem.m
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "JXMusicInfo.h"
#import <MediaPlayer/MPMediaItem.h>

@implementation JXMusicInfo

- (NSMutableDictionary *)playingInfo
{
    // 展示图片
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:self.picture];
    MPMediaItemArtwork *albumArt = [[MPMediaItemArtwork alloc] initWithImage:img];

    // 设置字典
    NSMutableDictionary *musicInfo = [[NSMutableDictionary alloc] init];
    
    save_setObj_forKey(musicInfo, _title,   MPMediaItemPropertyTitle);
    save_setObj_forKey(musicInfo, _author,  MPMediaItemPropertyArtist);
    save_setObj_forKey(musicInfo, _album,   MPMediaItemPropertyAlbumTitle);
    save_setObj_forKey(musicInfo, albumArt, MPMediaItemPropertyArtwork);

    return musicInfo;
}

#pragma mark -
#pragma mark 字典扩展

void save_setObj_forKey(NSMutableDictionary *dic, id obj, id<NSCopying>key){
    if ([dic isKindOfClass:[NSMutableDictionary class]] && obj) {
        [dic setObject:obj forKey:key];
    }
}

@end
