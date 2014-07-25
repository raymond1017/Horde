//
//  TaxiOnBoardStorageVC.h
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "DungeonsVC.h"

@protocol StorageCellDelegate <NSObject>

-(void)onSelectionChanged:(NSInteger)count;

@end

@interface TaxiOnBoardStorageVC : DungeonsVC
@property (strong, nonatomic) NSMutableDictionary* orderDetail;

@property (assign, nonatomic) NSInteger storageCount;

@property (weak, nonatomic) id<StorageCellDelegate> storageDelegate;
@end
