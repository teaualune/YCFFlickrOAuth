//
//  YCFOAuthManager.m
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import "YCFOAuthManager.h"

#import <AFOAuth1Client/AFOAuth1Client.h>
#import "NSDictionary+QueryStringParser.h"

#define kYCFAppKey @"2fa6a3d5646d7f246f0b1ceff0628b49"
#define kYCFAppSecret @"de95bb397b079caa"
#define kURLSCHEME @"zencheroauthexample://"
#define kYCFFlickrToken @"YCFFlickrToken"

static YCFOAuthManager *sharedInstance;

@interface YCFOAuthManager ()

- (BOOL)checkTokenExpired;

- (YCFFlickrToken *)flickrTokenWithAccessToken:(AFOAuth1Token *)authToken Response:(NSString *)response;

- (void)setToken:(YCFFlickrToken *)aToken;

@end

@implementation YCFOAuthManager

+ (YCFOAuthManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)login
{
    if ([self checkTokenExpired]) {
        AFOAuth1Client *client = [[AFOAuth1Client alloc] initWithBaseURL:[NSURL URLWithString:@"http://www.flickr.com/services/oauth"] key:kYCFAppKey secret:kYCFAppSecret];
        [client authorizeUsingOAuthWithRequestTokenPath:@"request_token" userAuthorizationPath:@"authorize" callbackURL:[NSURL URLWithString:kURLSCHEME] accessTokenPath:@"access_token" accessMethod:@"GET" scope:nil success:^(AFOAuth1Token *accessToken, id responseObject) {
            NSString *response = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            [self setToken: [self flickrTokenWithAccessToken:accessToken Response:response]];
        } failure:^(NSError *error) {
            NSLog(@"error!\n\n%@", error);
        }];
    }
}

- (void)applicationDidLaunchWithURL:(NSURL *)url
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAFApplicationLaunchedWithURLNotification object:self userInfo:@{kAFApplicationLaunchOptionsURLKey:url}];
}

- (NSString *)apiKey
{
    return kYCFAppKey;
}

- (NSString *)secret
{
    return kYCFAppSecret;
}

- (void)setToken:(YCFFlickrToken *)aToken
{
    _token = aToken;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:aToken] forKey:kYCFFlickrToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)checkTokenExpired
{
    NSData *tokenData = [[NSUserDefaults standardUserDefaults] objectForKey:kYCFFlickrToken];
    if (tokenData) {
        YCFFlickrToken *token = [NSKeyedUnarchiver unarchiveObjectWithData:tokenData];
        NSLog(@"exist in user default;\n\n%@", token);
        [self setToken:token];
        return token.accessToken.isExpired;
    } else {
        return YES;
    }
}

- (YCFFlickrToken *)flickrTokenWithAccessToken:(AFOAuth1Token *)authToken Response:(NSString *)response
{
    NSDictionary *query = [NSDictionary dictionaryWithQueryString:response];
    NSLog(@"%@", query);
    YCFFlickrToken *flickrToken = [[YCFFlickrToken alloc] init];
    flickrToken.accessToken = authToken;
    flickrToken.fullname = query[@"fullname"];
    flickrToken.OAuthToken = query[@"oauth_token"];
    flickrToken.OAuthTokenSecret = query[@"oauth_token_secret"];
    flickrToken.userNSID = query[@"user_nsid"];
    flickrToken.username = query[@"username"];
    return flickrToken;
}

@end
