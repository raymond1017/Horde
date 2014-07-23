//
//  TaxiPickingUpCompletedVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-22.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiPickingUpCompletedVC.h"
#import "TaxiOnBoardStorageVC.h"
#import "UILabel+Util.h"

@interface TaxiPickingUpCompletedVC ()

@end

@implementation TaxiPickingUpCompletedVC

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
    
    [self navigationWithTitle:T_(@"TaxiPickingUpCompleted_Title") isHiddenBack:NO];
    
    UIView* container = self.container_body;
    
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    int topOffset = 20;
    int leftMargin = 20;
    {
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 120)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
        UIImage* image = [UIImage imageNamed:@"1.jpg"];
        UIImageView* portrait = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin, 15, 50, 50)];
        [portrait setImage:image];
        [portrait setContentMode:UIViewContentModeScaleAspectFill];
        portrait.layer.masksToBounds = YES;
        portrait.layer.cornerRadius = portrait.frame.size.height / 2;
        portrait.layer.borderWidth = 1.0;
        portrait.layer.borderColor = [[UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0] CGColor];
        [section addSubview:portrait];
        
        UILabel* name = [UILabel new];
        name.frame = [UIHelper rightTo:portrait.frame margin:10 width:70 height:20];
        [name setText:@"名字名字"];
        [name setFont:[UIFont systemFontOfSize:15]];
        [name setBackgroundColor:[UIColor redColor]];
        [section addSubview:name];
        
        UILabel* desc = [UILabel new];
        desc.frame = [UIHelper bottomTo:name.frame margin:10 width:90 height:20];
        [desc setText:@"1~4人舒适型"];
        [desc setFont:[UIFont systemFontOfSize:15]];
        [section addSubview:desc];
        
        UILabel* license = [UILabel new];
        license.frame = [UIHelper rightTo:desc.frame margin:10 width:200 height:20];
        [license setText:@"车牌：EH－6548"];
        [license setFont:[UIFont systemFontOfSize:15]];
        [section addSubview:license];
        
        UILabel* spend = [UILabel new];
        spend.frame = [UIHelper bottomTo:desc.frame margin:15 width:200 height:25];
        [spend setText:@"预计花费185泰铢"];
        [spend setFont:[UIFont systemFontOfSize:18]];
        [spend setBackgroundColor:[UIColor redColor]];
        [section addSubview:spend];
        
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
        
        UILabel* detail = [[UILabel alloc] initWithFrame:CGRectMake(section.frame.size.width/2, section.frame.size.height/2, section.frame.size.width/2 - 20, 20)];
        [detail setText:T_(@"TaxiPickingUpCompleted_PathDetail")];
        [detail setTextAlignment:NSTextAlignmentRight];
        [detail setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
        [detail setFont:[UIFont systemFontOfSize:15]];
        
        [section addSubview:detail];
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 20;
        
        int margin = 1;
        
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 150)];
        [section setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
        [container addSubview:section];
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, margin, section.frame.size.width, section.frame.size.height / 3 - margin)];
        [btn1 setBackgroundColor:[UIColor whiteColor]];
        [btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn1.frame.size.width / 2, 0, 0)];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"TaxiPickingUpCompleted_Storage")];
            //            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn1];
            [btn1 addSubview:label];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:CGRectMake(btn1.frame.size.width/2, btn1.frame.size.height/2 - 10, btn1.frame.size.width/2 - 20, 20)];
            [tip setText:@"已选5件商品"];;
            [tip setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
            [tip setFont:[UIFont systemFontOfSize:15]];
            [tip setTextAlignment:NSTextAlignmentRight];
            
            [btn1 addSubview:tip];
            [btn1 addTarget:self action:@selector(handleSelectStorge:) forControlEvents:UIControlEventTouchUpInside];
        }
        [section addSubview:btn1];
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn1.frame.origin.y + btn1.frame.size.height + margin, section.frame.size.width, section.frame.size.height / 3 - margin)];
        [btn2 setBackgroundColor:[UIColor whiteColor]];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"TaxiPickingUpCompleted_PayInfo")];
            //            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:leftMargin andView:btn2];
            [btn2 addSubview:label];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:CGRectMake(btn1.frame.size.width/2, btn1.frame.size.height/2 - 10, btn1.frame.size.width/2 - 20, 20)];
            [tip setText:@"微信支付"];;
            [tip setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
            [tip setFont:[UIFont systemFontOfSize:15]];
            [tip setTextAlignment:NSTextAlignmentRight];
            
            [btn2 addSubview:tip];
        }
        [section addSubview:btn2];
        
        UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y + btn2.frame.size.height + margin, section.frame.size.width, section.frame.size.height / 3 - 2 *margin)];
        [btn3 setBackgroundColor:[UIColor whiteColor]];
        {
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"TaxiPickingUpCompleted_Wifi")];
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
        [btn setTitle:T_(@"TaxiPickingUpCompleted_Completed") forState:UIControlStateNormal];
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

-(void)handleSelectStorge:(id)sender {
    TaxiOnBoardStorageVC* vc = [TaxiOnBoardStorageVC new];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
