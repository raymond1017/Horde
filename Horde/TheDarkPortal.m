//
//  TheDarkPortal.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TheDarkPortal.h"
#import "OldCrafty.h"
#import "Orgrimar.h"

@implementation TheDarkPortal


+(NSMutableURLRequest*) makeUrlWithMethod:(NSString *)method{
    return [[NSMutableURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@/%@", sAppSetting.HOST, method]]];
}


+ (void) executeRequest:(NSMutableURLRequest*) request
            requestData:(NSMutableDictionary*) requestData
              onSucceed:(void(^) (NSMutableDictionary* response)) onSucceed
              onFailure:(void(^) (NSMutableDictionary* response)) onFailure{
    
    NSMutableDictionary* dict = [OldCrafty fakeRequestWithMethod:[[request URL] absoluteString] andRequestMethod:requestData];
    onSucceed(dict);
}


+(void) postPlaceOrder:(NSNumber*)flightNumber
             onSucceed:(void(^) (NSMutableDictionary* response)) response
             onFailure:(void(^) (NSMutableDictionary* status)) failure {
    
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [self executeRequest:[self makeUrlWithMethod:REQUEST_WEATHER] requestData:reqData onSucceed:response onFailure:failure];

}

+(void) queryWeatherWithCityID :(NSNumber*)cityID
                      onSucceed:(void(^) (NSMutableDictionary* response)) response
                      onFailure:(void(^) (NSMutableDictionary* status)) failure {
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [self executeRequest:[self makeUrlWithMethod:REQUEST_WEATHER] requestData:reqData onSucceed:response onFailure:failure];
}


+(void) queryStorageByID:(NSNumber*)storageID
               onSucceed:(void(^) (NSMutableDictionary* response)) response
               onFailure:(void(^) (NSMutableDictionary* status)) failure {
    NSMutableDictionary* reqData = [NSMutableDictionary new];
    [self executeRequest:[self makeUrlWithMethod:REQUEST_QUERY_STORAGE] requestData:reqData onSucceed:response onFailure:failure];
}
@end
