//
//  ArachnidQuarterVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "ArachnidQuarterVC.h"
#import "TaxiBookingVC.h"
#import "TaxiLookingForVC.h"
#import "TaxiPickingUpVC.h"
#import "TheDarkPortal.h"
#import "UILabel+Util.h"
#import "UIImageView+Util.h"
#import "TaxiPickingUpCompletedVC.h"

@interface ArachnidQuarterVC ()

@end

@implementation ArachnidQuarterVC

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
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    //    self.edgesForExtendedLayout = UIRectEdgeAll;
    [self navigationWithTitle:T_(@"Application_Name") isHiddenBack:YES];
    
    
    UIView* sky = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.container_body.frame.size.width, self.container_body.frame.size.height * 0.5)];
    [sky setBackgroundColor:[UIColor whiteColor]];
    UIView* land = [[UIView alloc] initWithFrame:CGRectMake(0, sky.frame.size.height, self.container_body.frame.size.width, self.container_body.frame.size.height * 0.5)];
    [land setBackgroundColor:[UIColor grayColor]];
    
    [self.container_body addSubview:sky];
    [self.container_body addSubview:land];
    
    {
        int offsetX = 30;
        //sky
        
        UILabel* currTemp = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, sky.frame.size.height - 80, 80, 23)];
        [currTemp setText:@"20℃"];
        [currTemp setFont:[UIFont systemFontOfSize:28.0]];
        [currTemp setTextColor:[UIColor colorWithRed:255.0/255.0 green:175/255.0 blue:37/255.0 alpha:1]];
        [sky addSubview:currTemp];
        
        UILabel* minTemp = [[UILabel alloc] initWithFrame:CGRectMake(offsetX + 65, sky.frame.size.height - 75, 60, 23)];
        [minTemp setText:@"/ -5℃"];
        [minTemp setFont:[UIFont systemFontOfSize:15.0]];
        [minTemp setTextColor:[UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1]];
        [sky addSubview:minTemp];
        
        UILabel* desc = [[UILabel alloc] initWithFrame:CGRectMake(offsetX, currTemp.frame.origin.y + currTemp.frame.size.height, 160, 40)];
        [desc setTextColor:[UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1]];
        [desc setText:@"18:47CST 晴转小雨"];
        [sky addSubview:desc];
        
        //获取天气逻辑
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            [TheDarkPortal queryWeatherWithCityID:[NSNumber numberWithInt:0] onSucceed:^(NSMutableDictionary* succeed){
                
            }onFailure:^(NSMutableDictionary* status){
                
            }];
        });
    }
    
    {
        int iconLeftMargin = 20;
        int textLeftMargin = 20;
        int arrowRightMargin = 20;
        
        NSInteger itemHeight = land.frame.size.height / 3 + 1;
        //land
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, land.frame.size.width, itemHeight)];
        [btn1 setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:175/255.0 blue:37/255.0 alpha:1]];
        [btn1 addTarget:self action:@selector(handlePickup:) forControlEvents:UIControlEventTouchUpInside];
        [land addSubview:btn1];
        {
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [imageView centerWithLeft:iconLeftMargin andView:btn1];
            [btn1 addSubview:imageView];
            
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"MainVC_Action_PickingUp")];
            [label setTextColor:[UIColor whiteColor]];
            [label setFont: [UIFont systemFontOfSize:20.0]];
            [label centerWithLeft:imageView.frame.size.width + imageView.frame.origin.x + textLeftMargin andView:btn1];
            [btn1 addSubview:label];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:arrowRightMargin andView:btn1];
            [btn1 addSubview:imgArrow];
            
        }
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn1.frame.origin.y + itemHeight, land.frame.size.width, itemHeight)];
        [btn2 setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:145/255.0 blue:28/255.0 alpha:1]];
        [btn2 addTarget:self action:@selector(handleLookingFor:) forControlEvents:UIControlEventTouchUpInside];
        [land addSubview:btn2];
        {
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [imageView centerWithLeft:iconLeftMargin andView:btn1];
            [btn2 addSubview:imageView];
            
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"MainVC_Action_LookingFor")];
            [label setTextColor:[UIColor whiteColor]];
            [label setFont: [UIFont systemFontOfSize:20.0]];
            [label centerWithLeft:imageView.frame.size.width + imageView.frame.origin.x + textLeftMargin andView:btn1];
            [btn2 addSubview:label];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:arrowRightMargin andView:btn1];
            [btn2 addSubview:imgArrow];
            
        }
        
        UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y + itemHeight, land.frame.size.width, itemHeight)];
        [btn3 setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:108/255.0 blue:18/255.0 alpha:1]];
        [btn3 addTarget:self action:@selector(handleBooking:) forControlEvents:UIControlEventTouchUpInside];
        [land addSubview:btn3];
        {
            UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [imageView centerWithLeft:iconLeftMargin andView:btn1];
            [btn3 addSubview:imageView];
            
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"MainVC_Action_Booking")];
            [label setTextColor:[UIColor whiteColor]];
            [label setFont: [UIFont systemFontOfSize:20.0]];
            [label centerWithLeft:imageView.frame.size.width + imageView.frame.origin.x + textLeftMargin andView:btn1];
            [btn3 addSubview:label];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:arrowRightMargin andView:btn1];
            [btn3 addSubview:imgArrow];
        }
    }
    
    self.view.window.autoresizesSubviews = YES;
}

- (void)handleLanguageChanged: (NSBundle*) bundle {
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

-(void)handlePickup:(id)sender {
    TaxiPickingUpVC* vc = [TaxiPickingUpVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)handleBooking:(id)sender {
    TaxiBookingVC* vc = [TaxiBookingVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)handleLookingFor:(id)sender {
//    TaxiLookingForVC* vc = [TaxiLookingForVC new];
//    [self presentViewController:vc animated:YES completion:nil];

    TaxiPickingUpCompletedVC* vc = [TaxiPickingUpCompletedVC new];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
