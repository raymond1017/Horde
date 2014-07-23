//
//  StorageItemCell.h
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define StorageItemCellHeight 180

@interface StorageItemCell : UITableViewCell
+(NSMutableArray*) changeToCellArrayWithDictionary:(NSMutableDictionary*) dict;

-(void) setStorageItems:(NSArray*) items;
@end
