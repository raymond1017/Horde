//
//  StorageItemSectionView.h
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StorageCellDelegate;

@interface StorageItemSectionView : UIView

-(void) setStorageItem:(NSMutableDictionary*) item;

@property (weak, nonatomic) id<StorageCellDelegate> cellDelegate;
@end
