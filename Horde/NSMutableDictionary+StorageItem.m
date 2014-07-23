//
//  NSMutableDictionary+StorageItem.m
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+StorageItem.h"

@implementation NSMutableDictionary(StorageItem)

-(NSString*) storageItem_title {
    return [self objectForKey:@"title"];
}

-(NSString*) storageItem_desc {
    return [self objectForKey:@"desc"];
}

-(NSString*) storageItem_value {
    return [self objectForKey:@"value"];
}

-(NSString*) storageItem_image {
    return [self objectForKey:@"image"];
}

-(enum storageItemType) storageItem_type {
    NSNumber* type = [self objectForKey:@"type"];
    
    return (enum storageItemType)[type intValue];
}

@end
