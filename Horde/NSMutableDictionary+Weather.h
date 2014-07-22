//
//  NSMutableDictionary+Weather.h
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

enum WeatherType{
    weathertype_other,
    weathertype_cleartoovercast,
};

@interface NSMutableDictionary(Weather)

-(NSString*) weather_temperature_min;
-(NSString*) weather_temperature_cur;
-(enum WeatherType) weather_temperature_type;

-(NSString*) weather_temperature_desc;
@end
