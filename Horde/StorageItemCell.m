//
//  StorageItemCell.m
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "StorageItemCell.h"
#import "UIHelper.h"
#import "StorageItemSectionView.h"

@interface StorageItemCell()

@property (weak, nonatomic) StorageItemSectionView* leftSection;
@property (weak, nonatomic) StorageItemSectionView* rightSection;

@end

@implementation StorageItemCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    int margin = 10;
    int sectionHeight = StorageItemCellHeight - margin * 2;
    self.backgroundColor = [UIColor clearColor];
    if (self) {
        // Initialization code
        
        StorageItemSectionView* leftSection = [[StorageItemSectionView alloc] initWithFrame:CGRectMake(margin, margin, (self.contentView.frame.size.width - 3 * margin) / 2, sectionHeight)];
        
        [leftSection setBackgroundColor:[UIColor redColor]];
        
        StorageItemSectionView* rightSection = [[StorageItemSectionView alloc] initWithFrame:[UIHelper rightTo:leftSection.frame margin:margin width:leftSection.frame.size.width height:sectionHeight]];
        
        [rightSection setBackgroundColor:[UIColor greenColor]];
        
        self.leftSection = leftSection;
        self.rightSection = rightSection;
        
        [self.contentView addSubview:leftSection];
        [self.contentView addSubview:rightSection];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setStorageItems:(NSArray*) items {
    NSMutableDictionary* left = [items objectAtIndex:0];
    NSMutableDictionary* right = [items objectAtIndex:1];
    
    [self.leftSection setStorageItem:left];
    [self.rightSection setStorageItem:right];
}

+(NSMutableArray*) changeToCellArrayWithDictionary:(NSMutableDictionary*) itemList {
    NSMutableArray* list = [itemList objectForKey:@"list"];
    
    NSMutableArray* ret = [NSMutableArray new];
    for(int i=0; i<[list count]; i+=2){
        NSMutableArray* item = [NSMutableArray new];
        
        NSMutableDictionary* dict = [list objectAtIndex:i];
        [item addObject:dict];
        
        if(i+1 < [dict count]){
            NSMutableDictionary* dictNext = [list objectAtIndex:i+1];
            [item addObject:dictNext];
        }
        
        [ret addObject:item];
    }
    
    return ret;
}
@end
