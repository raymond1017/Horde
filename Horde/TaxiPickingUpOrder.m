//
//  TaxiPickingUpOrder.m
//  Horde
//
//  Created by junwen.wu on 14-7-22.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiPickingUpOrder.h"
#import "UILabel+Util.h"
#import "TaxiCheckPointVC.h"

@interface TaxiPickingUpOrder ()
@property (strong, nonatomic) UIImageView* paymentSelection;
@end

@implementation TaxiPickingUpOrder

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)init {
    self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.paymentSelection = IMAGEVIEW_SCALE(@"选择对勾");
    
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
        
        UIButton* section = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 140)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
        UILabel* date = [[UILabel alloc] initWithFrame:CGRectMake(leftMargin, 15, section.frame.size.width, 20)];
        [date setText:@"后天 12:15"];
        [date setTextAlignment:NSTextAlignmentLeft];
        [date setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
        [section addSubview:date];
        
        UIImageView* ivStart = IMAGEVIEW_SCALE(@"起");
        UIImageView* ivEnd = IMAGEVIEW_SCALE(@"终");
        
        [ivStart setFrame:CGRectMake(leftMargin, date.frame.origin.y + date.frame.size.height + 10, ivStart.image.size.width, ivStart.image.size.height)];
        [ivEnd setFrame:CGRectMake(leftMargin, ivStart.frame.origin.y + ivStart.frame.size.height + 10, ivStart.image.size.width, ivStart.image.size.height)];
        [section addSubview:ivStart];
        [section addSubview:ivEnd];
        
        UILabel* start = [[UILabel alloc] initWithFrame:CGRectMake(ivStart.frame.origin.x + ivStart.frame.size.width + 15, date.frame.origin.y + date.frame.size.height + 15, section.frame.size.width, 20)];
        [start setText:@"素万那普国际机场"];
        [start setTextColor: [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0]];
        [section addSubview:start];
        
        UILabel* end = [[UILabel alloc] initWithFrame:CGRectMake(ivStart.frame.origin.x + ivStart.frame.size.width + 15, start.frame.origin.y + start.frame.size.height + 15, section.frame.size.width, 20)];
        [end setText:@"曼谷文华东方酒店"];
        [end setTextColor: [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0]];
        [section addSubview:end];
        
        UILabel* endTel = [[UILabel alloc] initWithFrame:CGRectMake(ivStart.frame.origin.x + ivStart.frame.size.width + 15, end.frame.origin.y + end.frame.size.height + 5, section.frame.size.width, 20)];
        [endTel setText:@"(0066-26249999)"];
        [endTel setTextColor: [UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
        [section addSubview:endTel];
        
//        UIButton* detail = [[UIButton alloc] initWithFrame:CGRectMake(section.frame.size.width - 130, section.frame.size.height/2, 150, 20)];
//        [detail setTitle:T_(@"TaxiPickingUpCompleted_PathDetail") forState:UIControlStateNormal];
////        [detail setTextAlignment:NSTextAlignmentRight];
//        [detail setTitleColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
//        [detail.titleLabel setFont:[UIFont systemFontOfSize:15]];
//        [detail setImage:IMAGE_SCALE(@"查看路线") forState:UIControlStateNormal];
//        [detail addTarget:self action:@selector(handleViewDetail:) forControlEvents:UIControlEventTouchUpInside];
//        [detail setImageEdgeInsets:UIEdgeInsetsMake(0.0,
//                                                     0.0,
//                                                     0.0,
//                                                     -(detail.frame.size.width))];
        
        
        UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
        arrow.frame = CGRectMake(section.frame.size.width - arrow.image.size.width - 5, section.frame.size.height/2, arrow.image.size.width, arrow.image.size.height);
        [section addSubview:arrow];
        
        UILabel* detail = [UILabel new];
        detail.frame = CGRectMake(section.frame.size.width - 110, 67, 200, 20);
        [detail setText:T_(@"TaxiPickingUpCompleted_PathDetail")];
        [detail setTextColor:RGB(233, 40, 0)];
        [detail setFont:[UIFont systemFontOfSize:15]];
//        [detail setBackgroundColor:[UIColor redColor]];
        [section addSubview:detail];
        [section addTarget:self action:@selector(handleViewDetail:) forControlEvents:UIControlEventTouchUpInside];
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 20;
        
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 80)];
        [section setBackgroundColor:RGB(255, 243, 219)];
        
        
//        "TaxiPickingUpDetail_Tips" = "本订单将从尾号为0425的信用卡中预授权125元，到达目的地后交易以实际情况结算";
        NSMutableAttributedString* str = [[NSMutableAttributedString alloc] initWithString:T_(@"TaxiPickingUpDetail_Tips")];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(8,4)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(20,4)];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(10, 16, container.frame.size.width - 20, 45)];
//        [label setText:T_(@"TaxiPickingUpDetail_Tips")];
        label.attributedText = str;
        [label setFont:[UIFont systemFontOfSize:16]];
        [label setNumberOfLines:2];
        [section addSubview:label];
        [container addSubview:section];
    }
    {
        topOffset += 20;
        
        int margin = 1;
        int btnCount = 3;
        
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 150)];
        [section setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
//        [container addSubview:section];
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, margin, section.frame.size.width, section.frame.size.height / 3 - margin)];
        [btn1 setBackgroundColor:[UIColor whiteColor]];
        [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn1.frame.size.width / 2, 0, 0)];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"Pay_Ailpay")];
//            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn1];
            [btn1 addSubview:label];
            
            [btn1 addTarget:self action:@selector(handlePaymentChanged:) forControlEvents:UIControlEventTouchUpInside];
            
            
            UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
            arrow.frame = CGRectMake(btn1.frame.size.width - arrow.image.size.width - 5, 15, arrow.image.size.width, arrow.image.size.height);
            [btn1 addSubview:arrow];
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
            
            [btn2 addTarget:self action:@selector(handlePaymentChanged:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
            arrow.frame = CGRectMake(btn1.frame.size.width - arrow.image.size.width - 5, 15, arrow.image.size.width, arrow.image.size.height);
            [btn2 addSubview:arrow];
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
            
            [btn3 addTarget:self action:@selector(handlePaymentChanged:) forControlEvents:UIControlEventTouchUpInside];
            
            UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
            arrow.frame = CGRectMake(btn1.frame.size.width - arrow.image.size.width - 5, 15, arrow.image.size.width, arrow.image.size.height);
            [btn3 addSubview:arrow];
        }
        [section addSubview:btn3];
        
        [self handlePaymentChanged:btn1];
        
        topOffset += section.frame.size.height;
    }
    {
        int btnHeight = 48;
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight, container.frame.size.width, btnHeight)];
        [btn setBackgroundColor:[UIColor blackColor]];
//        [btn setTitle:T_(@"TaxiPickingUpDetail_Tips") forState:UIControlStateNormal];
        [container addSubview:btn];
        [btn addTarget:self action:@selector(handleBack:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView* image = IMAGEVIEW_SCALE(@"框");
        image.frame = CGRectMake(btn.frame.size.width / 2 - image.image.size.width / 2, btn.frame.size.height / 2 - image.image.size.height / 2, image.image.size.width, image.image.size.height);
        [btn addSubview:image];
        
        UILabel* lab = [[UILabel alloc] initWithFrame:[btn bounds]];
        [lab setText:@"免费选取泰国特色赠品"];
        [lab setTextAlignment:NSTextAlignmentCenter];
        [lab setTextColor:[UIColor whiteColor]];
        [btn addSubview:lab];
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

- (void) handlePaymentChanged:(id)sender {
    return;
    [self.paymentSelection removeFromSuperview];
    UIButton* btn = (UIButton*)sender;
    
    [self.paymentSelection setFrame:CGRectMake(btn.frame.size.width - 30, (btn.frame.size.height - self.paymentSelection.image.size.height) / 2, self.paymentSelection.image.size.width, self.paymentSelection.image.size.height)];
    [btn addSubview:self.paymentSelection];
}

- (void) handleViewDetail:(id)sender {
    TaxiCheckPointVC* vc = [TaxiCheckPointVC new];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) handleBack:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    NSNotification * notification = [NSNotification notificationWithName:@"BACKTOINDEXNOTE" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
@end
