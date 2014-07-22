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
        
        {
            [resp setObject:@"-5" forKey:@"min"];
            [resp setObject:@"20" forKey:@"curr"];
            [resp setObject:[NSNumber numberWithInt:1] forKey:@"type"];
        }
        
        return resp;
        
    }else if([method isEqualToString: MAKE_WITH_REQUEST(REQUEST_FLIGHT)]) {
        NSMutableDictionary* resp = [NSMutableDictionary new];
        
        NSMutableArray* array = [NSMutableArray new];
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"TG615" forKey:@"no"];
            [dict setObject:@"泰国国际航空" forKey:@"company"];
            [dict setObject:@"21:15" forKey:@"arrivetime"];
            [dict setObject:@"曼谷素万那普机场" forKey:@"airport"];
        }
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"TG675" forKey:@"no"];
            [dict setObject:@"泰国国际航空" forKey:@"company"];
            [dict setObject:@"10:55" forKey:@"arrivetime"];
            [dict setObject:@"曼谷素万那普机场" forKey:@"airport"];
        }
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"CA979" forKey:@"no"];
            [dict setObject:@"中国国航" forKey:@"company"];
            [dict setObject:@"23:40" forKey:@"arrivetime"];
            [dict setObject:@"曼谷素万那普机场" forKey:@"airport"];
        }
        
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"CA821" forKey:@"no"];
            [dict setObject:@"中国国航" forKey:@"company"];
            [dict setObject:@"22:05" forKey:@"arrivetime"];
            [dict setObject:@"普吉岛机场" forKey:@"airport"];
        }
        
        [resp setObject:array forKey:@"list"];
        
        return resp;
    }
    
    return nil;
}

@end
