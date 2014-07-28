//
//  TaxiPickingUpVC.h
//  Horde
//
//  Created by junwen.wu on 14-7-20.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "DungeonsVC.h"


@protocol OrderDelegate <NSObject>

-(void)handleWaitingOrder:(NSString*)orderID;

@end

@interface TaxiPickingUpVC : DungeonsVC

@property (assign, nonatomic) id<OrderDelegate> orderDelegate;
@end
