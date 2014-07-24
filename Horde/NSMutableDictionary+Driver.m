//
//  NSMutableDictionary+Driver.m
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Driver.h"

@implementation NSMutableDictionary(Driver)

-(NSString*) driver_name {
    return [self objectForKey:@"name"];
}

-(NSString*) driver_avator {
    return [self objectForKey:@"avator"];
}

-(NSString*) driver_cartype {
    return [self objectForKey:@"type"];
}

-(NSString*) driver_license {
    return [self objectForKey:@"license"];
}
@end
