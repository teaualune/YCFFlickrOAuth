//
//  YCFFlickrToken.h
//  OAuthExample
//
//  Created by Tai-Lun Tseng on 6/24/13.
//  Copyright (c) 2013 Teaualune Tseng. All rights reserved.
//

#import "AFOAuth1Client.h"

@interface YCFFlickrToken : NSObject<NSCoding>

@property (nonatomic, strong) AFOAuth1Token *accessToken;

@property (nonatomic, strong) NSString *fullname;

@property (nonatomic, strong) NSString *OAuthToken;

@property (nonatomic, strong) NSString *OAuthTokenSecret;

@property (nonatomic, strong) NSString *userNSID;

@property (nonatomic, strong) NSString *username;

@end
