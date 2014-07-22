//
//  TaxiPickingUpVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-20.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiPickingUpVC.h"
#import "UIImageView+Util.h"
#import "UILabel+Util.h"

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
    CGFloat iconMargin = 10;
    CGFloat margin = 1;
    
    UIFont* font = [UIFont systemFontOfSize:15];
    {
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        btn1.layer.borderWidth = 1;
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_FlightNumber")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setFont:font];
            [btn1 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn1 addSubview:imgArrow];
        }
        
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Date")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn2];
            [lab setFont:font];
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
        }
        
        topOffset += btn2.frame.size.height;
        
        [self.container_body addSubview:btn1];
        [self.container_body addSubview:btn2];
        
    }
    
    {
        topOffset += 10;
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Location_Start")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setFont:font];
            [btn1 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn1 addSubview:imgArrow];
        }
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Location_End")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn2];
            [lab setFont:font];
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
        }
        
        topOffset += btn2.frame.size.height;
        
        [self.container_body addSubview:btn1];
        [self.container_body addSubview:btn2];
    }
    
    int btnHeight = 40;
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.container_body.frame.size.height - btnHeight * 2, self.container_body.frame.size.width, itemHeihgt)];
        [btn setTitle:T_(@"TaxiPickingUp_Estimated") forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:106.0/255.0 green:107.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [self.container_body addSubview:btn];
    }
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.container_body.frame.size.height - btnHeight, self.container_body.frame.size.width, btnHeight)];
        [btn setTitle:T_(@"TaxiPickingUp_PlaceOrder") forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        
        [self.container_body addSubview:btn];
    }
    
    //活动区域
    {
        topOffset += 5;
        
        UIView* viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, self.container_body.frame.size.width, self.container_body.frame.size.height - topOffset - btnHeight * 2)];
        [viewContainer setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
        [self.container_body addSubview:viewContainer];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setText:T_(@"TaxiPickingUp_SelectStyle")];
        [label setBackgroundColor:[UIColor whiteColor]];
//        [label centerText:CGRectMake(0, 0, viewContainer.frame.size.width, 30)];
        [viewContainer addSubview:label];
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
