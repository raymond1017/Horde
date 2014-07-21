//
//  NSMutableDictionary+Weather.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Weather.h"

@implementation NSMutableDictionary(Weather)

-(NSString*) weather_temperature {
    return [self objectForKey:@"temperature"];
}
@end
