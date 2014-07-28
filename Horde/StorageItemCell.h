//
//  StorageItemCell.h
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define StorageItemCellHeight 196

@class StorageItemSectionView;

@protocol StorageCellDelegate <NSObject>

-(void)handleAddItem:(StorageItemSectionView*) view
             andItem:(NSMutableDictionary*)item;

@end

@interface StorageItemCell : UITableViewCell
+(NSMutableArray*) changeToCellArrayWithDictionary:(NSMutableDictionary*) dict;

-(void) setStorageItems:(NSArray*) items;

@property (weak, nonatomic) id<StorageCellDelegate> cellDelegate;
@end
