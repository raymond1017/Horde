//
//  NSBundle+Language.m
//  Horde
//
//  Created by junwen.wu on 14-7-20.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSBundle+Language.h"

@implementation NSBundle(Language)

-(NSString*) translateByKey: (NSString*)key {
    return [self localizedStringForKey:key value:@"Undefine Lang" table:@"Horde"];
}

@end
