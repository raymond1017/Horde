//
//  TheDarkPortal.h
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

#define REQUEST_WEATHER @"common/weather.htm"
#define REQUEST_FLIGHT @"common/flight.htm"
#define REQUEST_QUERY_STORAGE @"storage/query"
#define REQUEST_DRIVERINFO @"driver/query"
#define REQUEST_ORDER_QUERY @"order/query"
#define COMMIT_ORDER @"user/commit"
#define PULL_ORDER @"order/pull"

@interface TheDarkPortal : NSObject

+(void) queryWeatherWithCityID :(NSNumber*)cityID
                      onSucceed:(void(^) (NSMutableDictionary* response)) repsonse
                      onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) commitOrder:(NSNumber*)flightNumber
             onSucceed:(void(^) (NSMutableDictionary* response)) response
             onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) pullOrder:(NSString*)orderID
        onSucceed:(void(^) (NSMutableDictionary* response)) response
        onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) queryStorageByID:(NSNumber*)storageID
               onSucceed:(void(^) (NSMutableDictionary* response)) response
               onFailure:(void(^) (NSMutableDictionary* status)) failure;

+(void) queryOrder:(NSNumber*)orderID
         onSucceed:(void(^) (NSMutableDictionary* response)) response
         onFailure:(void(^) (NSMutableDictionary* status)) failure;


+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method;
@end

#define MAKE_WITH_REQUEST(x) [[[TheDarkPortal makeUrlWithMethod:x] URL] absoluteString]