//
//  TaxiPickingUpVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-20.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiPickingUpVC.h"

@interface TaxiPickingUpVC ()

@end

@implementation TaxiPickingUpVC

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
    
    [self navigationWithTitle:T_(@"TaxiPickingUp_Title") isHiddenBack:NO];
    
    [self.container_body setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    CGFloat topOffset = 5;
    CGFloat itemHeihgt = 50;
    CGFloat margin = 1;
    {
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        
        topOffset += btn2.frame.size.height;
        
        [self.container_body addSubview:btn1];
        [self.container_body addSubview:btn2];
    }
    
    {
        topOffset += 10;
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        
        topOffset += btn2.frame.size.height;
        
        [self.container_body addSubview:btn1];
        [self.container_body addSubview:btn2];
    }
    {
        topOffset += 110;
    }
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn setTitle:T_(@"TaxiPickingUp_Estimated") forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:106.0/255.0 green:107.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [self.container_body addSubview:btn];
    }
    {
        int btnHeight = 40;
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.container_body.frame.size.height - btnHeight, self.container_body.frame.size.width, btnHeight)];
        [btn setTitle:T_(@"TaxiPickingUp_PlaceOrder") forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        
        [self.container_body addSubview:btn];
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
