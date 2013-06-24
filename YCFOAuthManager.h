//
//  YCFOAuthManager.h
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCFFlickrToken.h"

@interface YCFOAuthManager : NSObject

@property (nonatomic, strong, readonly) NSString *apiKey;

@property (nonatomic, strong, readonly) NSString *secret;

@property (nonatomic, strong, readonly) YCFFlickrToken *token;

+ (YCFOAuthManager *)sharedManager;

- (void)login;

- (void)applicationDidLaunchWithURL:(NSURL *)url;

@end
