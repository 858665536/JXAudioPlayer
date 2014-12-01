//
//  JXViewController.m
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import "JXViewController.h"
#import "JXMusicInfo.h"
#import "JXMusicPlayer.h"

@interface JXViewController ()

@end

@implementation JXViewController

#pragma mark -
#pragma mark 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];

    _musicList = [NSMutableArray new];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MusicList" ofType:@"plist"]];

    for (NSDictionary *dict in arr) {
        NSLog(@"%@", dict);
        JXMusicInfo *musicInfo = [JXMusicInfo new];
        musicInfo.url     = [[NSBundle mainBundle] pathForResource:dict[@"title"]
                                                            ofType:@"mp3"];
        musicInfo.title   = dict[@"title"];
        musicInfo.author  = dict[@"author"];
        musicInfo.album   = dict[@"album"];
        musicInfo.picture = [[NSBundle mainBundle] pathForResource:dict[@"title"]
                                                            ofType:@"jpg"];

        musicInfo.localResource = YES;
        [_musicList addObject:musicInfo];
    }
    
    JXMusicPlayer *player = [JXMusicPlayer shareInstance];
    player.musicList = _musicList;
    [player play];
}

@end
