//
//  NSMutableDictionary+Flight.m
//  Horde
//
//  Created by junwen.wu on 14-7-21.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Flight.h"

@implementation NSMutableDictionary(Flight)


-(NSMutableArray*) flight_list {
    return [self objectForKey:@"list"];
}

-(NSString*) flight_airport {
    return [self objectForKey:@"airport"];
}

-(NSString*) flight_no {
    return [self objectForKey:@"no"];
}

-(NSString*) flight_company {
    return [self objectForKey:@"company"];
}

-(NSString*) flight_arrivetime {
    return [self objectForKey:@"arrivetime"];
    
}
@end
