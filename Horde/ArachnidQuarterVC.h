//
//  ArachnidQuarterVC.h
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "DungeonsVC.h"


@protocol MissionDelegate <NSObject>

-(void) handleNewMission:(NSString*)missionID;

@end


@interface ArachnidQuarterVC : DungeonsVC
@property (assign, nonatomic) id<MissionDelegate> missionDelegate;
@end
