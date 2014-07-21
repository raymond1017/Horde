//
//  HordeTests.m
//  HordeTests
//
//  Created by junwen.wu on 14-7-17.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TheDarkPortal.h"
#import "NSMutableDictionary+Response.h"
#import "NSMutableDictionary+Status.h"
#import "NSMutableDictionary+Weather.h"

@interface HordeTests : XCTestCase

@end

@implementation HordeTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testOldCrafty {
    
    [TheDarkPortal queryWeatherWithCityID:[NSNumber numberWithInt:0] onSucceed:^(NSMutableDictionary* succeed) {
      
        NSString* str = [succeed weather_temperature];
        
        
    }onFailure:^(NSMutableDictionary* status) {
        
        
        
    }];
}

@end
