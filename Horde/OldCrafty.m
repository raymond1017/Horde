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
            [resp setObject:@"-5℃" forKey:@"min"];
            [resp setObject:@"20℃" forKey:@"curr"];
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
            [item setObject:@"1" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛一日游" forKey:@"title"];
            [item setObject:@"南湾海滩度假区是巴厘岛的舞蹈与戏剧扮演着" forKey:@"desc"];
            [item setObject:@"230" forKey:@"value"];
            [item setObject:@"2" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:2] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"雅玛花式铁板烧" forKey:@"title"];
            [item setObject:@"价值198元雅玛花式铁板烧单人自助" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"3" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:3] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛3天2晚5星自由行" forKey:@"title"];
            [item setObject:@"价值50元代金卷新鲜优质" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"4" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛3天2晚5星自由行" forKey:@"title"];
            [item setObject:@"价值50元代金卷新鲜优质" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"5" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        {
            NSMutableDictionary* item = [NSMutableDictionary new];
            [item setObject:@"巴厘岛3天2晚5星自由行" forKey:@"title"];
            [item setObject:@"价值50元代金卷新鲜优质" forKey:@"desc"];
            [item setObject:@"888" forKey:@"value"];
            [item setObject:@"6" forKey:@"image"];
            [item setObject:[NSNumber numberWithInt:1] forKey:@"type"];
            [array addObject:item];
        }
        
        [resp setObject:array forKey:@"list"];
        return resp;
    }else if([method isEqualToString:MAKE_WITH_REQUEST(REQUEST_ORDER_QUERY)]){
        NSMutableDictionary* resp = [NSMutableDictionary new];
        {
            [resp setObject:@"BJ 11402120129125" forKey:@"id"];
            [resp setObject:@"185" forKey:@"value"];
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                
                [dict setObject:@"一个名字" forKey:@"name"];
                [dict setObject:[NSNumber numberWithInt:0] forKey:@"sex"];
                [dict setObject:@"EH-6548" forKey:@"license"];
                [dict setObject:@"1.jpg" forKey:@"avator"];
                [dict setObject:@"1~4人舒适型" forKey:@"info"];
                [dict setObject:[NSNumber numberWithInt:4] forKey:@"star"];
                
                [resp setObject:dict forKey:@"driverinfo"];
            }
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:@"后天 12:15" forKey:@"date"];
                [dict setObject:@"素万那普国际机场" forKey:@"begin"];
                [dict setObject:@"曼谷文华东方酒店" forKey:@"end"];
                [dict setObject:@"0066-26249999" forKey:@"tel"];
                
                [resp setObject:dict forKey:@"info"];
            }
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:[NSNumber numberWithInt:5] forKey:@"count"];
                [dict setObject:@"OD0055" forKey:@"id"];
                
                [resp setObject:dict forKey:@"storage"];
            }
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:@"微信支付" forKey:@"type"];
                
                
                [resp setObject:dict forKey:@"payment"];
            }
            {
                NSMutableDictionary* dict = [NSMutableDictionary new];
                [dict setObject:@"TP_LINK_3850403" forKey:@"ssid"];
                [dict setObject:@"H03B481" forKey:@"password"];
                
                [resp setObject:dict forKey:@"wifi"];
            }
        }
        return resp;
    }
    
    return nil;
}

@end
