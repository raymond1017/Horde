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
#import "NSMutableDictionary+OrderDetail.h"
#import "NSMutableDictionary+Mission.h"
#import "TheDarkPortal.h"
#import "TaxiCheckPointVC.h"

@interface TaxiPickingUpCompletedVC () <StorageCellDelegate>
@property (weak, nonatomic) UIImageView* driver_portrait;
@property (weak, nonatomic) UILabel* driver_name;
@property (weak, nonatomic) UIImageView* driver_sex;
@property (weak, nonatomic) UIView* driver_star;
@property (weak, nonatomic) UILabel* driver_desc;
@property (weak, nonatomic) UILabel* driver_license;
@property (weak, nonatomic) UILabel* driver_cost;

@property (weak, nonatomic) UILabel* info_date;
@property (weak, nonatomic) UILabel* info_begin;
@property (weak, nonatomic) UILabel* info_end;
@property (weak, nonatomic) UILabel* info_tel;

@property (weak, nonatomic) UILabel* storage_count;

@property (weak, nonatomic) UIButton* payment_type;

@property (weak, nonatomic) UILabel* wifiinfo;

@property (strong, nonatomic) NSMutableDictionary* orderDetail;

@property (assign, nonatomic) NSInteger selection;

@property (weak, nonatomic) UIImageView* fake1;
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
    int topOffset = 10;
    int leftMargin = 20;
    {
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 91)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
//        UIImage* image = [UIImage imageNamed:@"1.jpg"];
        UIImageView* portrait = [[UIImageView alloc] initWithFrame:CGRectMake(leftMargin, 15, 50, 50)];
//        [portrait setImage:image];
        [portrait setContentMode:UIViewContentModeScaleAspectFill];
        portrait.layer.masksToBounds = YES;
        portrait.layer.cornerRadius = portrait.frame.size.height / 2;
        portrait.layer.borderWidth = 1.0;
        portrait.layer.borderColor = [[UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:100.0/255.0 alpha:1.0] CGColor];
//        [section addSubview:portrait];
        
        UILabel* name = [UILabel new];
        name.frame = [UIHelper rightTo:portrait.frame margin:10 width:70 height:20];
//        [name setText:@"名字名字"];
        [name setFont:[UIFont systemFontOfSize:15]];
        [name setBackgroundColor:[UIColor redColor]];
//        [section addSubview:name];
        
        UILabel* desc = [UILabel new];
        desc.frame = [UIHelper bottomTo:name.frame margin:10 width:90 height:20];
//        [desc setText:@"1~4人舒适型"];
        [desc setFont:[UIFont systemFontOfSize:15]];
//        [section addSubview:desc];
        
        UILabel* license = [UILabel new];
        license.frame = [UIHelper rightTo:desc.frame margin:10 width:200 height:20];
//        [license setText:@"车牌：EH－6548"];
        [license setFont:[UIFont systemFontOfSize:15]];
//        [section addSubview:license];
        
        UILabel* spend = [UILabel new];
        spend.frame = [UIHelper bottomTo:desc.frame margin:15 width:200 height:25];
//        [spend setText:@"预计花费185泰铢"];
        [spend setFont:[UIFont systemFontOfSize:18]];
        [spend setBackgroundColor:[UIColor redColor]];
//        [section addSubview:spend];
        
        UIImageView* fakeImage = IMAGEVIEW_SCALE(@"未出发");
        self.fake1 = fakeImage;
        [section addSubview:fakeImage];
        
        self.driver_name = name;
        self.driver_portrait = portrait;
        self.driver_desc = desc;
        self.driver_license = license;
        self.driver_cost = spend;
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 40;
        
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
        
        [detail setBackgroundColor:[UIColor clearColor]];
        
        [section addSubview:detail];
        
        [section addTarget:self action:@selector(handleViewDetail:) forControlEvents:UIControlEventTouchUpInside];
        
        topOffset += section.frame.size.height;
    }
    {
        topOffset += 10;
        
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
            
            UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
            [arrow setFrame:CGRectMake(btn1.frame.size.width - arrow.image.size.width - 5, btn1.frame.size.height/2 - 8, arrow.image.size.width, arrow.image.size.height)];
            [btn1 addSubview:arrow];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:CGRectMake(btn1.frame.size.width - 160 - arrow.frame.size.width, btn1.frame.size.height/2 - 10, 150, 20)];
            [tip setText:T_(@"TaxiPickingUpCompleted_Selection")];
            [tip setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
            [tip setFont:[UIFont systemFontOfSize:15]];
//            [tip setBackgroundColor:[UIColor yellowColor]];
            [tip setTextAlignment:NSTextAlignmentRight];
            
            self.storage_count = tip;
            
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
            
            UIImageView* arrow = IMAGEVIEW_SCALE(@"查看路线");
            [arrow setFrame:CGRectMake(btn2.frame.size.width - arrow.image.size.width - 5, btn2.frame.size.height/2 - 8, arrow.image.size.width, arrow.image.size.height)];
            [btn2 addSubview:arrow];
            
            UILabel* tip = [[UILabel alloc] initWithFrame:CGRectMake(btn1.frame.size.width - 160 - arrow.frame.size.width, btn1.frame.size.height/2 - 10, 150, 20)];
            [tip setText:T_(@"Pay_Wechatpay")];
            [tip setTextColor:[UIColor colorWithRed:233/255.0 green:40/255.0 blue:0/255.0 alpha:1.0]];
            [tip setFont:[UIFont systemFontOfSize:15]];
            //            [tip setBackgroundColor:[UIColor yellowColor]];
            [tip setTextAlignment:NSTextAlignmentRight];
            
//            self.payment_type = tip;
            
            [btn2 addSubview:tip];
        }
        [section addSubview:btn2];
        
        UIButton* btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, btn2.frame.origin.y + btn2.frame.size.height + margin, section.frame.size.width, section.frame.size.height / 3 - 2 *margin)];
        [btn3 setBackgroundColor:[UIColor whiteColor]];
        {
            UIImageView* imageView = IMAGEVIEW_SCALE(@"Wifi");
            [imageView setFrame:CGRectMake(leftMargin, 15, imageView.image.size.width, imageView.image.size.height)];
            [btn3 addSubview:imageView];
            
            UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
            [label setText:T_(@"TaxiPickingUpCompleted_Wifi")];
            //            [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [label centerWithLeft:imageView.frame.origin.x + imageView.frame.size.width andView:btn3];
            [btn3 addSubview:label];
        }
        [btn3 setImage:IMAGE_SCALE(@"查看路线") forState:UIControlStateNormal];
        [btn3 setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                 0.0,
                                                 0.0,
                                                 -(btn3.frame.size.width - 20))];
        
        [section addSubview:btn3];
        
        topOffset += section.frame.size.height;
    }
    {
        int btnHeight = 49;
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight, container.frame.size.width, btnHeight)];
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitle:T_(@"TaxiPickingUpCompleted_Completed") forState:UIControlStateNormal];
        [container addSubview:btn];
        
    }
    
    {
        [TheDarkPortal queryOrder:[NSNumber numberWithInt:[self.orderID intValue]] onSucceed:^(NSMutableDictionary* succeed){
            dispatch_async(dispatch_get_main_queue(), ^(void){
                if([[[[succeed mission_items] firstObject] mission_item_status] isEqualToString:@"free"]) {
                    [self.fake1 setImage:IMAGE_SCALE(@"未出发")];
                }else if([[[[succeed mission_items] firstObject] mission_item_status] isEqualToString:@"busy"]){
                    [self.fake1 setImage:IMAGE_SCALE(@"在路上")];
                }else if([[[[succeed mission_items] firstObject] mission_item_status] isEqualToString:@"waiting"]){
                    [self.fake1 setImage:IMAGE_SCALE(@"已到达")];
                }else {
                    [self.fake1 setImage:IMAGE_SCALE(@"未出发")];
                }
            });
//            NSString* cost = [succeed orderdetail_cost];
//            {
//                NSMutableDictionary* dict = [succeed orderdetail_driverinfo];
//                [self.driver_portrait setImage:[UIImage imageNamed:[dict orderdetail_driverinfo_avator]]];
//                [self.driver_name setText:[dict orderdetail_driverinfo_name]];
//                [self.driver_desc setText:[dict orderdetail_driverinfo_carinfo]];
//                [self.driver_license setText:[[NSString alloc] initWithFormat:T_(@"TaxiPickingUpCompleted_Lisence"), [dict orderdetail_driverinfo_license]]];
//                [self.driver_cost setText:[[NSString alloc] initWithFormat:T_(@"TaxiPickingUpCompleted_Cost"), cost]];
//            }
//            {
//                NSMutableDictionary* dict = [succeed orderdetail_info];
//                [self.info_date setText:[dict orderdetail_info_date]];
//                [self.info_begin setText:[dict orderdetail_info_begin]];
//                [self.info_end setText:[dict orderdetail_info_end]];
//                [self.info_tel setText:[dict orderdetail_info_tel]];
//            }
//            {
//                NSMutableDictionary* dict = [succeed orderdetail_payment];
//                [self.payment_type setTitle:[dict orderdetail_payment_type] forState:UIControlStateNormal];
////                [self.payment_type setText:[dict orderdetail_payment_type]];
//            }
//            {
//                NSMutableDictionary* dict = [succeed orderdetail_storage];
//                [self.storage_count setText:[[NSString alloc] initWithFormat:T_(@"TaxiPickingUpCompleted_Selection"), [dict orderdetail_storage_selectCount]]];
////                [self.storage_count setText:[[NSString alloc] initWithFormat:T_(@"TaxiPickingUpCompleted_Selection"), [dict orderdetail_storage_selectCount]]];
//            }
            self.orderDetail = succeed;
        }onFailure:^(NSMutableDictionary* status){
            
            
        }];
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
    vc.orderDetail = self.orderDetail;
    vc.storageDelegate = self;
    vc.storageCount = self.selection;
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)handleViewDetail:(id)sender {
    
    TaxiCheckPointVC* vc = [TaxiCheckPointVC new];
    [self presentViewController:vc animated:YES completion:nil];
}


-(void)onSelectionChanged:(NSInteger)count {
    self.selection = count;
    [self.storage_count setText:[[NSString alloc] initWithFormat:T_(@"TaxiOnBoradStorage_Selection"), count]];
}


@end
