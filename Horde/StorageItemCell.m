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
        
        UIView* leftSection = [[UIView alloc] initWithFrame:CGRectMake(margin, margin, (self.contentView.frame.size.width - 3 * margin) / 2, sectionHeight)];
        [leftSection setBackgroundColor:[UIColor redColor]];
        int innerMargin = 5;
        {
            UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(innerMargin, innerMargin, leftSection.frame.size.width - 2*innerMargin, 90)];
            [imageView setBackgroundColor:[UIColor blackColor]];
            [leftSection addSubview:imageView];
            
            UILabel* label = [UILabel new];
            label.frame = [UIHelper bottomTo:imageView.frame margin:innerMargin width:imageView.frame.size.width height:30];
            [label setBackgroundColor:[UIColor grayColor]];
            [leftSection addSubview:label];
            
            self.bgImg = imageView;
        }
        
        UIView* rightSection = [[UIView alloc] initWithFrame:CGRectZero];
        rightSection.frame = [UIHelper rightTo:leftSection.frame margin:margin width:leftSection.frame.size.width height:sectionHeight];
        [rightSection setBackgroundColor:[UIColor greenColor]];
        
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
