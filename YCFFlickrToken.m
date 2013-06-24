//
//  YCFFlickrToken.m
//  OAuthExample
//
//  Created by Tai-Lun Tseng on 6/24/13.
//  Copyright (c) 2013 Teaualune Tseng. All rights reserved.
//

#import "YCFFlickrToken.h"

@implementation YCFFlickrToken

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.accessToken = [decoder decodeObjectForKey:@"accessToken"];
    self.fullname = [decoder decodeObjectForKey:@"fullname"];
    self.OAuthToken = [decoder decodeObjectForKey:@"OAuthToken"];
    self.OAuthTokenSecret = [decoder decodeObjectForKey:@"OAuthTokenSecret"];
    self.userNSID = [decoder decodeObjectForKey:@"userNSID"];
    self.username = [decoder decodeObjectForKey:@"username"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.accessToken forKey:@"accessToken"];
    [coder encodeObject:self.fullname forKey:@"fullname"];
    [coder encodeObject:self.OAuthToken forKey:@"OAuthToken"];
    [coder encodeObject:self.OAuthTokenSecret forKey:@"OAuthTokenSecret"];
    [coder encodeObject:self.userNSID forKey:@"userNSID"];
    [coder encodeObject:self.username forKey:@"username"];
}

@end
