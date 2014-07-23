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
#import "TaxiPickingUpOrder.h"

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
    
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
    [self.container_body addSubview:scrollview];
    UIView* container = scrollview;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    CGFloat topOffset = 5;
    CGFloat itemHeihgt = 50;
    CGFloat iconMargin = 10;
    CGFloat margin = 1;
    
    UIFont* font = [UIFont systemFontOfSize:15];
    {
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_FlightNumber")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [btn1 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn1 addSubview:imgArrow];
        }
        
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Date")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn2];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
        }
        
        topOffset += btn2.frame.size.height;
        
        [container addSubview:btn1];
        [container addSubview:btn2];
        
    }
    
    {
        topOffset += 10;
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Location_Start")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [btn1 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn1 addSubview:imgArrow];
        }
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"traffic_airport.png"]];
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Location_End")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn2];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
        }
        
        topOffset += btn2.frame.size.height;
        
        [container addSubview:btn1];
        [container addSubview:btn2];
    }
    
    int btnHeight = 40;
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight * 2, container.frame.size.width, itemHeihgt)];
        [btn setTitle:T_(@"TaxiPickingUp_Estimated") forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:106.0/255.0 green:107.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [container addSubview:btn];
    }
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight, container.frame.size.width, btnHeight)];
        [btn setTitle:T_(@"TaxiPickingUp_PlaceOrder") forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(handlePickingUp:) forControlEvents:UIControlEventTouchUpInside];
        
        [container addSubview:btn];
    }
    
    //活动区域
    {
        topOffset += 5;
        int margin = 1;
        
        UIView* viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, container.frame.size.height - topOffset - btnHeight * 2)];
        [viewContainer setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
        [container addSubview:viewContainer];
        
        //车型文本
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, margin, viewContainer.frame.size.width, 30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
        [label setText:T_(@"TaxiPickingUp_SelectStyle")];
        [label setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:label];
        
        int carCount = 4;
        //选择车型
        UIView* car1 = [[UIView alloc] initWithFrame:CGRectMake(0, label.frame.origin.y + label.frame.size.height + margin, viewContainer.frame.size.width / carCount - margin, 100)];
        [car1 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:car1];
        
        UIView* car2 = [[UIView alloc] initWithFrame:CGRectMake(car1.frame.origin.x + car1.frame.size.width + margin, label.frame.origin.y + label.frame.size.height + margin, viewContainer.frame.size.width / carCount - margin, 100)];
        [car2 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:car2];
        
        UIView* car3 = [[UIView alloc] initWithFrame:CGRectMake(car2.frame.origin.x + car2.frame.size.width + margin, label.frame.origin.y + label.frame.size.height + margin, viewContainer.frame.size.width / carCount - margin, 100)];
        [car3 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:car3];
        
        UIView* car4 = [[UIView alloc] initWithFrame:CGRectMake(car3.frame.origin.x + car3.frame.size.width + margin, label.frame.origin.y + label.frame.size.height + margin, viewContainer.frame.size.width / carCount, 100)];
        [car4 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:car4];
        int sexCount = 2;
        //选择性别
        UIView* sex1 = [[UIView alloc] initWithFrame:CGRectMake(0, car1.frame.origin.y + car1.frame.size.height + margin, viewContainer.frame.size.width / sexCount - (sexCount - 1) * margin, viewContainer.frame.size.height - label.frame.size.height - car1.frame.size.height - 4 * margin)];
        [sex1 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:sex1];
        
        UIView* sex2 = [[UIView alloc] initWithFrame:CGRectMake(sex1.frame.origin.x + sex1.frame.size.width + margin, car1.frame.origin.y + car1.frame.size.height + margin, viewContainer.frame.size.width / sexCount - (sexCount - 1) * margin, viewContainer.frame.size.height - label.frame.size.height - car1.frame.size.height - 4 * margin)];
        [sex2 setBackgroundColor:[UIColor whiteColor]];
        [viewContainer addSubview:sex2];
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

-(void)handlePickingUp:(id)sender {
    
    TaxiPickingUpOrder* vc = [TaxiPickingUpOrder new];
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
