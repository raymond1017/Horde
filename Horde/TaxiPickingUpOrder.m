//
//  TaxiPickingUpOrder.m
//  Horde
//
//  Created by junwen.wu on 14-7-22.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiPickingUpOrder.h"
#import "UILabel+Util.h"

@interface TaxiPickingUpOrder ()

@end

@implementation TaxiPickingUpOrder

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
    
    [self navigationWithTitle:T_(@"TaxiPickingUpDetail_Title") isHiddenBack:NO];
    
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
    [self.container_body addSubview:scrollview];
    
    UIView* container = scrollview;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    int topOffset = 20;
    int leftMargin = 20;
    {
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 120)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
        UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, section.frame.size.width, 18)];
        [label1 setText:T_(@"TaxiPickingUpDetail_Succeed")];
        [label1 setTextColor: [UIColor colorWithRed:76.0/255.0 green:175/255.0 blue:25.0/255.0 alpha:1.0]];
        [label1 setTextAlignment:NSTextAlignmentCenter];
        [label1 setFont:[UIFont systemFontOfSize:18]];
        
        UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, label1.frame.origin.y + label1.frame.size.height, section.frame.size.width, 40)];
        [label2 setText:T_(@"TaxiPickingUpDetail_Succeed_Tip")];
        [label2 setTextColor: [UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
        [label2 setTextAlignment:NSTextAlignmentCenter];
        [label2 setFont:[UIFont systemFontOfSize:15]];
        
        [section addSubview:label1];
        [section addSubview:label2];
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 20;
        
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 140)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
        UILabel* date = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, 15, section.frame.size.width, 20)];
        [date setText:@"后天 4月16日 12:15"];
        [date setTextAlignment:NSTextAlignmentLeft];
        [date setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
        [section addSubview:date];
        
        UILabel* start = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, date.frame.origin.y + date.frame.size.height + 15, section.frame.size.width, 20)];
        [start setText:@"素万那普国际机场"];
        [start setTextColor: [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0]];
        [section addSubview:start];
        
        UILabel* end = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, start.frame.origin.y + start.frame.size.height + 15, section.frame.size.width, 20)];
        [end setText:@"曼谷莲花大酒店"];
        [end setTextColor: [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0]];
        [section addSubview:end];
        
        UILabel* endTel = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, end.frame.origin.y + end.frame.size.height + 5, section.frame.size.width, 20)];
        [endTel setText:@"(0066-26249999)"];
        [endTel setTextColor: [UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
        [section addSubview:endTel];
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 20;
        
        int margin = 1;
        int btnCount = 3;
        
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 150)];
        [section setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
        [container addSubview:section];
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, margin, section.frame.size.width, section.frame.size.height / 3 - margin)];
        [btn1 setBackgroundColor:[UIColor whiteColor]];
        [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn1.frame.size.width / 2, 0, 0)];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"Pay_Ailpay")];
//            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn1];
            [btn1 addSubview:label];
        }
        [section addSubview:btn1];
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn1.frame.origin.y + btn1.frame.size.height + margin, section.frame.size.width, section.frame.size.height / 3 - margin)];
        [btn2 setBackgroundColor:[UIColor whiteColor]];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"Pay_Wechatpay")];
//            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn2];
            [btn2 addSubview:label];
        }
        [section addSubview:btn2];
        
        UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y + btn2.frame.size.height + margin, section.frame.size.width, section.frame.size.height / 3 - 2 *margin)];
        [btn3 setBackgroundColor:[UIColor whiteColor]];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"Pay_CreditCard")];
//            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn3];
            [btn3 addSubview:label];
        }
        [section addSubview:btn3];
        
        topOffset += section.frame.size.height;
    }
    {
        int btnHeight = 40;
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight, container.frame.size.width, btnHeight)];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitle:T_(@"TaxiPickingUpDetail_Tips") forState:UIControlStateNormal];
        [container addSubview:btn];
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
