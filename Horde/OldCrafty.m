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
            [array addObject:dict];
        }
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"TG675" forKey:@"no"];
            [dict setObject:@"泰国国际航空" forKey:@"company"];
            [dict setObject:@"10:55" forKey:@"arrivetime"];
            [dict setObject:@"曼谷素万那普机场" forKey:@"airport"];
            [array addObject:dict];
        }
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"CA979" forKey:@"no"];
            [dict setObject:@"中国国航" forKey:@"company"];
            [dict setObject:@"23:40" forKey:@"arrivetime"];
            [dict setObject:@"曼谷素万那普机场" forKey:@"airport"];
            [array addObject:dict];
        }
        
        {
            NSMutableDictionary* dict = [NSMutableDictionary new];
            [dict setObject:@"CA821" forKey:@"no"];
            [dict setObject:@"中国国航" forKey:@"company"];
            [dict setObject:@"22:05" forKey:@"arrivetime"];
            [dict setObject:@"普吉岛机场" forKey:@"airport"];
            [array addObject:dict];
        }
        
        [resp setObject:array forKey:@"list"];
        
        return resp;
    }else if([method isEqualToString:MAKE_WITH_REQUEST(REQUEST_QUERY_STORAGE)]){
        NSMutableDictionary* resp = [NSMutableDictionary new];
        
        NSMutableArray* array = [NSMutableArray new];
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"" forKey:@"title"];
            [item setObject:@"普吉岛西蒙人妖表演秀成人VIP" forKey:@"desc"];
            [item setObject:@"230" forKey:@"value"];
            [item setObject:@"" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛一日游" forKey:@"title"];
            [item setObject:@"南湾海滩度假区是巴厘岛的舞蹈与戏剧扮演着" forKey:@"desc"];
            [item setObject:@"230" forKey:@"value"];
            [item setObject:@"" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:2] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"雅玛花式铁板烧" forKey:@"title"];
            [item setObject:@"价值198元雅玛花式铁板烧单人自助" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:3] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛3天2晚5星自由行" forKey:@"title"];
            [item setObject:@"价值50元代金卷新鲜优质" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        
        [resp setObject:resp forKey:@"list"];
    }
    
    return nil;
}

@end
