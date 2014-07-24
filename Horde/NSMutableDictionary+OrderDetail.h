//
//  NSMutableDictionary+OrderDetail.h
//  Horde
//
//  Created by junwen.wu on 14-7-24.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>


enum DriverSex {
    driverSex_male,
    driverSex_female,
};

@interface NSMutableDictionary(OrderDetail)

-(NSString*) orderdetail_orderID;
-(NSString*) orderdetail_cost;

-(NSMutableDictionary*) orderdetail_driverinfo;
-(NSMutableDictionary*) orderdetail_info;
-(NSMutableDictionary*) orderdetail_storage;
-(NSMutableDictionary*) orderdetail_payment;
-(NSMutableDictionary*) orderdetail_wifi;

//司机信息
-(NSString*) orderdetail_driverinfo_name;
-(enum DriverSex) orderdetail_driverinfo_sex;
-(NSString*) orderdetail_driverinfo_license;
-(NSString*) orderdetail_driverinfo_carinfo;
-(NSString*) orderdetail_driverinfo_avator;
-(NSNumber*) orderdetail_driverinfo_star;

//路线信息
-(NSString*) orderdetail_info_date;
-(NSString*) orderdetail_info_begin;
-(NSString*) orderdetail_info_end;
-(NSString*) orderdetail_info_tel;
-(NSString*) orderdetail_info_detail;

//车上货柜信息
-(NSNumber*) orderdetail_storage_selectCount;
-(NSNumber*) orderdetail_storage_ID;

//支付信息
-(NSString*) orderdetail_payment_type;

//wifi
-(NSString*) orderdetail_wifi_ssid;
-(NSString*) orderdetail_wifi_password;

@end
