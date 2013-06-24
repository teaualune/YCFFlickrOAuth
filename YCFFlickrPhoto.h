//
//  YCFFlickrPhoto.h
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCFFlickrPhoto : NSObject<NSCoding, NSCopying>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageURL;

+ (NSString *)imageURLWithFarm:(NSString *)farm imageID:(NSString *)imageID secret:(NSString *)secret server:(NSString *)server;

+ (YCFFlickrPhoto *)photoWithTitle:(NSString *)title farm:(NSString *)farm imageID:(NSString *)imageID secret:(NSString *)secret server:(NSString *)server;

@end
