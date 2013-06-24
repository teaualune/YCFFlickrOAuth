//
//  YCFFlickrPhoto.m
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import "YCFFlickrPhoto.h"

@implementation YCFFlickrPhoto

+ (NSString *)imageURLWithFarm:(NSString *)farm imageID:(NSString *)imageID secret:(NSString *)secret server:(NSString *)server
{
    // http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    static NSString *BasicFormat = @"http://farm%@.staticflickr.com/%@/%@_%@.jpg";
    return [NSString stringWithFormat:BasicFormat, farm, server, imageID, secret];
}

+ (YCFFlickrPhoto *)photoWithTitle:(NSString *)title farm:(NSString *)farm imageID:(NSString *)imageID secret:(NSString *)secret server:(NSString *)server
{
    YCFFlickrPhoto *p = [[YCFFlickrPhoto alloc] init];
    p.title = title;
    p.imageURL = [YCFFlickrPhoto imageURLWithFarm:farm imageID:imageID secret:secret server:server];
    return p;
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = [decoder decodeObjectForKey:@"title"];
    self.imageURL = [decoder decodeObjectForKey:@"imageURL"];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.imageURL forKey:@"imageURL"];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    YCFFlickrPhoto *copy = [[YCFFlickrPhoto allocWithZone:zone] init];
    copy.title = self.title;
    copy.imageURL = self.imageURL;
    return copy;
}

@end
