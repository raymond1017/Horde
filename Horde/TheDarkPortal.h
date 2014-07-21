//
//  TheDarkPortal.h
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REQUEST_WEATHER @"weather.htm"
#define REQUEST_PLACEORDER @"order/commit"

@interface TheDarkPortal : NSObject

+(void) queryWeatherWithCityID :(NSNumber*)cityID
                      onSucceed:(void(^) (NSMutableDictionary* response)) repsonse
                      onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) commitOrder:(NSNumber*)flightNumber
             onSucceed:(void(^) (NSMutableDictionary* response)) response
             onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method;
@end

#define MAKE_WITH_REQUEST(x) [[[TheDarkPortal makeUrlWithMethod:x] URL] absoluteString]