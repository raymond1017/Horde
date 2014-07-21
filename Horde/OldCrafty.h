//
//  OldCrafty.h
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OldCrafty : NSObject

+(NSMutableDictionary*) fakeRequestWithMethod:(NSString*)method
                            andRequestMethod:(NSMutableDictionary*)data;
@end
