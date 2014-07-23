//
//  StorageItemSectionView.m
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "StorageItemSectionView.h"
#import "StorageItemCell.h"
#import "UIHelper.h"

@implementation StorageItemSectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    int margin = 10;
    int sectionHeight = StorageItemCellHeight - margin * 2;
    
    if (self) {
        
        UIView* leftSection = [[UIView alloc] initWithFrame:CGRectMake(margin, margin, (frame.size.width - 3 * margin) / 2, sectionHeight)];
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
        
        [self addSubview: leftSection];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
