//
//  NSMutableDictionary+Mission.h
//  Alliance
//
//  Created by junwen.wu on 14-7-25.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(Mission)

-(NSMutableArray*) mission_items;

-(NSString*) mission_id;
-(NSString*) mission_item_time;
-(NSString*) mission_item_weather;
-(NSString*) mission_item_begin;
-(NSString*) mission_item_end;
-(NSString*) mission_item_cost;
-(NSNumber*) mission_item_driverId;
-(NSString*) mission_item_status;
@end
