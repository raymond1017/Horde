//
//  OldCrafty.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "OldCrafty.h"
#import "TheDarkPortal.h"

@implementation OldCrafty

+(NSMutableDictionary*) weatherWithData:(NSMutableDictionary*) data {
    NSMutableDictionary* dict = [NSMutableDictionary new];
    
    return dict;
}

+(NSMutableDictionary*) fakeRequestWithMethod:(NSString*)method
                            andRequestMethod:(NSMutableDictionary*)data {
    if([method isEqualToString: MAKE_WITH_REQUEST(REQUEST_WEATHER)] ){
        NSMutableDictionary* resp = [NSMutableDictionary new];
    }
    
    return nil;
}

@end
