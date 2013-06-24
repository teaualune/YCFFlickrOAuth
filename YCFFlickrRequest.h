//
//  YCFFlickrRequest.h
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCFFlickrRequest : NSObject

- (void)getPhotoList: (void(^)(NSError *error, NSArray *result))completion;

- (void)uploadPhoto: (void(^)(NSError *error))completion;

@end
