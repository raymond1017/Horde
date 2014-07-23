//
//  NSMutableDictionary+StorageItem.h
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

enum storageItemType {
    storageItemType_none = 0,
    storageItemType_Tickets,
    storageItemType_DayTour,
    storageItemType_Coupons
};

@interface NSMutableDictionary(StorageItem)

-(NSString*) storageItem_title;
-(NSString*) storageItem_desc;
-(NSString*) storageItem_value;
-(NSString*) storageItem_image;
-(enum storageItemType) storageItem_type;

@end
