//
//  NSMutableDictionary+Flight.h
//  Horde
//
//  Created by junwen.wu on 14-7-21.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(Flight)

-(NSMutableArray*) flight_list;

-(NSString*) flight_airport;
-(NSString*) flight_no;
-(NSString*) flight_company;
-(NSString*) flight_arrivetime;

@end
