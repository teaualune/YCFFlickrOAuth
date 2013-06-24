//
//  NSDictionary+QueryStringParser.m
//  OAuthExample
//
//  Created by Tai-Lun Tseng on 6/24/13.
//  Copyright (c) 2013 Teaualune Tseng. All rights reserved.
//

#import "NSDictionary+QueryStringParser.h"

@implementation NSDictionary (QueryStringParser)

+ (NSDictionary *)dictionaryWithQueryString:(NSString *)queryString
{
    NSArray *components = [queryString componentsSeparatedByString:@"&"];
    if ([components count] <= 1) {
        return @{};
    }

    NSMutableDictionary *md = [@{} mutableCopy];
    for (NSString *component in components) {
        NSArray *param = [component componentsSeparatedByString:@"="];
        if ([param count] == 2 && param[1]) {
            md[param[0]] = param[1];
        }
    }
    return md;
}

@end
