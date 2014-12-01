//
//  JXMusicItem.h
//  JXAudioPlayer
//
//  Created by andy on 12/1/14.
//  Copyright (c) 2014 Andy Jin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JXMusicInfo : NSObject
#pragma mark -
#pragma mark Music Resource

/**
 *  资源链接
 */
@property (nonatomic, copy) NSString *url;

/**
 *  是否为本地资源
 */
@property (nonatomic, assign, getter=isLocalResource) BOOL localResource;

#pragma mark -
#pragma mark Music Info

/**
 *  音乐名称
 */
@property (nonatomic, copy) NSString *title;
/**
 *  音乐作者
 */
@property (nonatomic, copy) NSString *author;
/**
 *  音乐专辑
 */
@property (nonatomic, copy) NSString *album;
/**
 *  音乐展示图片
 */
@property (nonatomic, copy) NSString *picture;


#pragma mark -
#pragma mark Music Item Info

/**
 *  播放音乐资料
 */
@property (nonatomic, readonly) NSMutableDictionary *playingInfo;

@end
