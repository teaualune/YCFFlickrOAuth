//
//  NSDictionary+QueryStringParser.h
//  OAuthExample
//
//  Created by Tai-Lun Tseng on 6/24/13.
//  Copyright (c) 2013 Teaualune Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (QueryStringParser)

+ (NSDictionary *)dictionaryWithQueryString:(NSString *)queryString;

@end
