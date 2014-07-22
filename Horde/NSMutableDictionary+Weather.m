//
//  NSMutableDictionary+Weather.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Weather.h"
#import "Orgrimar.h"

@implementation NSMutableDictionary(Weather)

-(NSString*) weather_temperature_min {
    return [self objectForKey:@"min"];
}

-(NSString*) weather_temperature_cur {
    return [self objectForKey:@"curr"];
}

-(enum WeatherType) weather_temperature_type {
    return [[self objectForKey:@"type"] intValue];
}


-(NSString*) weather_temperature_desc {
    switch ([self weather_temperature_type]) {
        case weathertype_cleartoovercast:
            return T_(@"Weather_CleartoOvercast");
            break;
            
        default:
            break;
    }
    return @"";
}
@end
