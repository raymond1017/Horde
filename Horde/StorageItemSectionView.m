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
#import "NSMutableDictionary+StorageItem.h"
#import "Orgrimar.h"

@interface StorageItemSectionView()

@property (weak, nonatomic) UIImageView* bgImg;
@property (weak, nonatomic) UILabel* desc;
@property (weak, nonatomic) UILabel* value;

@end

@implementation StorageItemSectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        int innerMargin = 5;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(innerMargin, innerMargin, frame.size.width - 2*innerMargin, 90)];
        [imageView setBackgroundColor:[UIColor blackColor]];
        [self addSubview:imageView];
        
        UILabel* label = [UILabel new];
        label.frame = [UIHelper bottomTo:imageView.frame margin:innerMargin width:imageView.frame.size.width height:30];
        [label setBackgroundColor:[UIColor grayColor]];
        [label setFont:[UIFont systemFontOfSize:12]];
        label.numberOfLines = 2;
        [self addSubview:label];
        
        UILabel* labelValue = [[UILabel alloc] initWithFrame:[UIHelper bottomTo:label.frame margin:10 width:50 height:15]];
        [labelValue setBackgroundColor:[UIColor orangeColor]];
        [labelValue setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:labelValue];
        
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width / 2 - innerMargin, labelValue.frame.origin.y, frame.size.width / 2, 18)];
        [btn setTitle:T_(@"TaxiOnBoardStorage_Buy") forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [btn setBackgroundColor:[UIColor colorWithRed:243.0/255.0 green:69.0/255.0 blue:60.0/255.0 alpha:1.0]];
        [self addSubview:btn];
        
        self.desc = label;
        self.bgImg = imageView;
        self.value = labelValue;
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

-(void) setStorageItem:(NSMutableDictionary*) item {
    if(item == nil){
        [self clearItem];
        return;
    }
    
    NSString* title = [item storageItem_title];
    NSString* desc;
    if([title length] > 1){
        desc = [[NSString alloc] initWithFormat:@"【%@】%@", title, [item storageItem_desc]];
    }else{
        desc = [item storageItem_desc];
    }
    
    NSString* value;
    
    
    [self.bgImg setImage:[UIImage imageNamed: [item storageItem_image]]];
    [self.desc setText:desc];
    [self.value setText:[item storageItem_value]];
    
}

-(void) clearItem {
    [self.bgImg setImage:nil];
    [self.desc setText:@""];
    [self.value setText:@""];
}

@end
