//
//  MilitaryQuarterVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "MilitaryQuarterVC.h"

@interface MilitaryQuarterVC ()

@end

@implementation MilitaryQuarterVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
    [self.container_body addSubview:scrollview];
    UIView* container = scrollview;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    [self navigationWithTitle:T_(@"Storage_title") isHiddenBack:YES];
    
    UIImageView* view = IMAGEVIEW_SCALE(@"货柜整张");
    [scrollview addSubview:view];
    
    [scrollview setContentSize:view.image.size];
    
    
    {
        UIImage* shoppingImg = IMAGE_SCALE(@"购物车");
        UIButton* shopping = [[UIButton alloc] initWithFrame:CGRectMake(container.frame.size.width - shoppingImg.size.width - 20, container.frame.size.height - shoppingImg.size.height - 20, shoppingImg.size.width, shoppingImg.size.height)];
        [shopping setImage:shoppingImg forState:UIControlStateNormal];
        [self.container_body addSubview:shopping];
        
        UIImageView* bg = IMAGEVIEW_SCALE(@"提示");
        [bg setFrame:CGRectMake(shopping.frame.size.width - 25, 12, bg.image.size.width, bg.image.size.height)];
        [bg setBackgroundColor:[UIColor clearColor]];
        [shopping addSubview:bg];
        
        UILabel* count = [[UILabel alloc] initWithFrame:[bg frame]];
        [count setText: [[NSNumber numberWithInteger:0] stringValue]];
        [count setFont:[UIFont systemFontOfSize:12]];
        [count setTextColor:[UIColor whiteColor]];
        [count setTextAlignment:NSTextAlignmentCenter];
        [shopping addSubview:count];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
