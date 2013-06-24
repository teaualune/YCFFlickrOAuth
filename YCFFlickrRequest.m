//
//  YCFFlickrRequest.m
//  OAuthExample
//
//  Created by Teaualune Tseng on 13/6/22.
//  Copyright (c) 2013年 Teaualune Tseng. All rights reserved.
//

#import "YCFFlickrRequest.h"

#import "YCFOAuthManager.h"
#import <AFNetworking/AFNetworking.h>
#import "YCFFlickrPhoto.h"

#define YCFSearchTag @"yahooclothesfinder"

@interface YCFFlickrRequest ()

@property (nonatomic, strong) AFHTTPClient *client;


@end

@implementation YCFFlickrRequest

- (id)init
{
    self = [super init];
    if (self) {
        _client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.flickr.com"]];
    }
    return self;
}

- (void)getPhotoList: (void(^)(NSError *error, NSArray *result))completion
{
    [self.client getPath:@"services/rest" parameters:@{
     @"api_key": [YCFOAuthManager sharedManager].apiKey,
     @"method": @"flickr.photos.search",
     @"format": @"json",
     @"nojsoncallback": @1,
//     @"user_id": @"me",
//     @"tags": YCFSearchTag
     @"tags": @"duck",
     @"per_page": @10
     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
         if ([result[@"stat"] isEqualToString:@"ok"]) {
             NSDictionary *photoJSON = result[@"photos"][@"photo"];
             NSMutableArray *photos = [@[] mutableCopy];
             for (NSDictionary *p in photoJSON) {
                 YCFFlickrPhoto *photoObj = [YCFFlickrPhoto photoWithTitle:p[@"title"] farm:p[@"farm"] imageID:p[@"id"] secret:p[@"secret"] server:p[@"server"]];
                 [photos addObject:photoObj];
             }
             completion(nil, photos);
         } else {
             completion([NSError errorWithDomain:@"statError" code:0 userInfo:nil], nil);
         }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         completion(error, nil);
    }];
}

- (void)uploadPhoto: (void(^)(NSError *error))completion
{/*
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"device6.jpg"], 0.5);

    [YCFOAuthManager sharedManager].
    NSString *sig = [NSString stringWithFormat:@"%@api_key%@auth_token%@", ];
    NSMutableURLRequest *request = [self.client multipartFormRequestWithMethod:@"POST" path:@"services/upload" parameters:@{
                                    @"format": @"json",
                                    @"nojsoncallback": @1,
                                    @"title": @"test",
                                    @"tags": YCFSearchTag,
                                    @"is_public": @0,
                                    @"is_friend": @0,
                                    @"is_family": @0,
                                    @"safety_level": @1,
                                    @"content_type": @3
                                    } constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                        [formData appendPartWithFileData:imageData name:@"device6" fileName:@"device6.jpg" mimeType:@"image/jpeg"];
                                    }];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"set %lld of %lld bytes", totalBytesWritten, totalBytesExpectedToWrite);
    }];
    [self.client enqueueHTTPRequestOperation:operation];
*/}

@end
