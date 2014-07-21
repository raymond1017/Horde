//
//  Orgrimar.h
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>


enum HOST_TYPE{
    HOST_DEV,
    HOST_BETA,
    HOST_ONLINE
};

enum LANGUAGE_TYPE {
    LANGUAGE_zhCN,
    LANGUAGE_enUS
};

@interface Orgrimar : NSObject
+(Orgrimar*) instance;

@property (strong, nonatomic) NSString *HOST;
@property (strong, nonatomic) NSString *HOST_TOUCH;
@property (strong, nonatomic) NSString *HOST_PB;

@property (strong, nonatomic) NSBundle *LANG_BUNDLE;

-(void) initialization;
-(void) changeHost:(enum HOST_TYPE)type;
-(void) changeLanguage:(enum LANGUAGE_TYPE)type;
+(NSString*) translateByBundle:(NSBundle*)bundle
                        andKey:(NSString*)key;
-(NSString*) translateByKey:(NSString*)key;
@end

#define T_(x) [[Orgrimar instance] translateByKey:x]
#define sAppSetting [Orgrimar instance]
