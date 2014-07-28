//
//  NSMutableDictionary+OrderDetail.m
//  Horde
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+OrderDetail.h"

@implementation NSMutableDictionary(OrderDetail)

-(NSString*) orderdetail_orderID {
    return [self objectForKey:@"orderId"];
}

-(NSString*) orderdetail_cost {
    return [self objectForKey:@"value"];
}

-(NSMutableDictionary*) orderdetail_driverinfo {
    return [self objectForKey:@"driverinfo"];
}

-(NSMutableDictionary*) orderdetail_info {
    return [self objectForKey:@"info"];
}

-(NSMutableDictionary*) orderdetail_storage {
    return [self objectForKey:@"storage"];
}

-(NSMutableDictionary*) orderdetail_payment {
    return [self objectForKey:@"payment"];
}

-(NSMutableDictionary*) orderdetail_wifi {
    return [self objectForKey:@"wifi"];
}

-(NSString*) orderdetail_driverinfo_name {
    return [self objectForKey:@"name"];
}

-(enum DriverSex) orderdetail_driverinfo_sex {
    NSNumber* sex = [self objectForKey:@"sex"];
    return [sex intValue]== 0 ? driverSex_male : driverSex_female;
}

-(NSString*) orderdetail_driverinfo_license {
    return [self objectForKey:@"license"];
}

-(NSString*) orderdetail_driverinfo_carinfo {
    return [self objectForKey:@"info"];
}

-(NSString*) orderdetail_driverinfo_avator {
    return [self objectForKey:@"avator"];
}

-(NSNumber*) orderdetail_driverinfo_star {
    return [self objectForKey:@"star"];
}

-(NSString*) orderdetail_info_date {
    return [self objectForKey:@"date"];
}

-(NSString*) orderdetail_info_begin {
    return [self objectForKey:@"begin"];
}

-(NSString*) orderdetail_info_end {
    return [self objectForKey:@"end"];
}

-(NSString*) orderdetail_info_tel {
    return [self objectForKey:@"tel"];
}

-(NSString*) orderdetail_info_detail {
    return [self objectForKey:@"detail"];
}

//车上货柜信息
-(NSNumber*) orderdetail_storage_selectCount {
    return [self objectForKey:@"count"];
}

-(NSNumber*) orderdetail_storage_ID {
    return [self objectForKey:@"id"];
}

//支付信息
-(NSString*) orderdetail_payment_type {
    return [self objectForKey:@"type"];
}

//wifi
-(NSString*) orderdetail_wifi_ssid {
    return [self objectForKey:@"ssid"];
}

-(NSString*) orderdetail_wifi_password {
    return [self objectForKey:@"password"];
}
@end
