//
//  Orgrimar.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "Orgrimar.h"

#define DEV_HOST @"http://l-lvtu8.lvtu.dev.cn6.qunar.com:7213"


@implementation Orgrimar

+(Orgrimar*) instance {
    static Orgrimar* this = nil;
    if(this == nil){
        this = [Orgrimar new];
        [this initialization];
    }
    return this;
}

-(id)init {
    self = [super init];
    return self;
}

-(void) initialization {
    [self changeHost:HOST_DEV];
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSNumber *defLang = [def valueForKey:@"userLanguage"];
    
    //取一个默认的
//    if([string length] < 1){
        //          根据系统切换的逻辑
        //        NSArray* languages = [def objectForKey:@"AppleLanguages"];
        //        NSString *current = [languages objectAtIndex:0];
        //        string = current;
        //        [def setValue:current forKey:@"userLanguage"];
        //        [def synchronize];//持久化，不加的话不会保存
//        [self changeLanguage:LANGUAGE_zhCN];
//    }
    [self changeLanguage:[defLang intValue]];
}

-(NSString*) translateByKey:(NSString*)key {
    return [self.LANG_BUNDLE localizedStringForKey:key value:@"Undefine Lang" table:@"Horde"];
}

-(void) changeLanguage:(enum LANGUAGE_TYPE)type {
    
    NSString *lang = nil;
    switch(type){
        case LANGUAGE_zhCN:
        {
            lang = @"zh-Hans";
            break;
        }
        case LANGUAGE_enUS:
        {
            lang = @"en";
            break;
        }
        default:
            break;
    }
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:[NSNumber numberWithInt:type] forKey:@"userLanguage"];
    [def synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
    [self setValue:[NSBundle bundleWithPath:path] forKeyPath:@"LANG_BUNDLE"];
}

-(void) changeHost:(enum HOST_TYPE)type {
    
    switch (type) {
        case HOST_DEV:{
            _HOST = DEV_HOST;
            break;
        }
        case HOST_BETA:{
            _HOST = DEV_HOST;
            break;
        }
        case HOST_ONLINE:{
            _HOST = DEV_HOST;
            break;
        }
        default:
            break;
    }
}
@end
