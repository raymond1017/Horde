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
#import "TheDarkPortal.h"
#import "UIView+Util.h"
#import "NSMutableDictionary+OrderDetail.h"

@interface TaxiPickingUpVC () <UITextFieldDelegate>

@property (strong, nonatomic) UIImageView* carSelection;
@property (strong, nonatomic) UIImageView* sexSelection;

@property (weak, nonatomic) UILabel* pickingUpStart;
@property (weak, nonatomic) UILabel* pickingDate;
@property (weak, nonatomic) UITextField* pickingUpEnd;

@property (weak, nonatomic) UITextField* flightNo;
@property (weak, nonatomic) UIView* calSelector;
@property (weak, nonatomic) UIView* calBackgounrd;

@property (weak, nonatomic) UIDatePicker* picker;

@property (strong, nonatomic) NSString* orderID;
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
    
    self.carSelection = IMAGEVIEW_SCALE(@"选择");
    self.sexSelection = IMAGEVIEW_SCALE(@"选择");
    
    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
    [self.container_body addSubview:scrollview];
    UIView* container = scrollview;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    CGFloat topOffset = 15;
    CGFloat itemHeihgt = 50;
    CGFloat iconMargin = 10;
    CGFloat margin = 1;
    
    UIFont* font = [UIFont systemFontOfSize:15];
    {
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = IMAGEVIEW_SCALE(@"选择航班号");
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UITextField* lab = [[UITextField alloc] initWithFrame:[UIHelper rightTo:img.frame margin:iconMargin width:btn1.frame.size.width height:30]];
//            UILabel* lab = [UILabel new];
            [lab setPlaceholder:T_(@"TaxiPickingUp_FlightNumber")];
//            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [lab setDelegate:self];
            [btn1 addSubview:lab];
            
            self.flightNo = lab;
//            UIImageView* imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
//            [imgArrow centerWithRight:iconMargin andView:btn1];
//            [btn1 addSubview:imgArrow];
        }
        
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = IMAGEVIEW_SCALE(@"选择接机时间");
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(48, 15, 300, 20)];
            [lab setText:T_(@"TaxiPickingUp_Date")];
//            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn2];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            self.pickingDate = lab;
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = IMAGEVIEW_SCALE(@"填写接机_进入");
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
            
            [btn2 addTarget:self action:@selector(handleDateTouched:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        topOffset += btn2.frame.size.height;
        
        [container addSubview:btn1];
        [container addSubview:btn2];
        
    }
    
    {
        topOffset += 15;
        
        UIButton* btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn1 setBackgroundColor: [UIColor whiteColor]];
        
        {
            UIImageView* img = IMAGEVIEW_SCALE(@"起");
            [img centerWithLeft:iconMargin andView:btn1];
            
            [btn1 addSubview:img];
            
            UILabel* lab = [UILabel new];
            [lab setText:T_(@"TaxiPickingUp_Location_Start")];
            [lab centerWithLeft:img.frame.origin.x + img.frame.size.width + iconMargin andView:btn1];
            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [btn1 addSubview:lab];
            
            UIImageView* imgArrow = IMAGEVIEW_SCALE(@"填写接机_进入");
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn1 addSubview:imgArrow];
            
            self.pickingUpStart = lab;
        }
        
        topOffset += btn1.frame.size.height + margin;
        
        UIButton* btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, itemHeihgt)];
        [btn2 setBackgroundColor: [UIColor whiteColor]];
        {
            UIImageView* img = IMAGEVIEW_SCALE(@"终");
            [img centerWithLeft:iconMargin andView:btn2];
            
            [btn2 addSubview:img];
            
            UITextField* lab = [[UITextField alloc] initWithFrame:[UIHelper rightTo:img.frame margin:iconMargin width:btn2.frame.size.width height:30]];
            [lab setPlaceholder:T_(@"TaxiPickingUp_Location_End")];
//            [lab setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
            [lab setFont:font];
            [lab setDelegate:self];
            [btn2 addSubview:lab];
            
            UIImageView* imgArrow = IMAGEVIEW_SCALE(@"填写接机_进入");
            [imgArrow centerWithRight:iconMargin andView:btn1];
            [btn2 addSubview:imgArrow];
            
            
            self.pickingUpEnd = lab;
        }
        
        topOffset += btn2.frame.size.height;
        
        [container addSubview:btn1];
        [container addSubview:btn2];
    }
    
    int btnHeight = 40;
    {
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, container.frame.size.height - btnHeight * 2, container.frame.size.width, itemHeihgt)];
        [btn setImage:IMAGE_SCALE(@"价格") forState:UIControlStateNormal];
        [btn setTitle:T_(@"TaxiPickingUp_Estimated") forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:106.0/255.0 green:107.0/255.0 blue:111.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                     0.0,
                                                     0.0,
                                                     10.0)];

        
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
        topOffset += 15;
        int margin = 1;
        
        UIView* viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, 144)];
        [viewContainer setBackgroundColor:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0]];
        [container addSubview:viewContainer];
        
        UIImageView* fackImage = IMAGEVIEW_SCALE(@"选择车型");
        [viewContainer addSubview:fackImage];
        
        //车型文本
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, margin, viewContainer.frame.size.width, 30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setTextColor:[UIColor colorWithRed:141.0/255.0 green:141.0/255.0 blue:141.0/255.0 alpha:1.0]];
        [label setText:T_(@"TaxiPickingUp_SelectStyle")];
        [label setBackgroundColor:[UIColor whiteColor]];
//        [viewContainer addSubview:label];
        
        int carCount = 4;
        //选择车型
        UIButton* car1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 22, viewContainer.frame.size.width / carCount - margin, 73)];
        [car1 setBackgroundColor:[UIColor clearColor]];
        [viewContainer addSubview:car1];
        [car1 addTarget:self action:@selector(handleCarChanged:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton* car2 = [[UIButton alloc] initWithFrame:CGRectMake(car1.frame.origin.x + car1.frame.size.width + margin, car1.frame.origin.y, viewContainer.frame.size.width / carCount - margin, 73)];
        [car2 setBackgroundColor:[UIColor clearColor]];
        [viewContainer addSubview:car2];
        [car2 addTarget:self action:@selector(handleCarChanged:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton* car3 = [[UIButton alloc] initWithFrame:CGRectMake(car2.frame.origin.x + car2.frame.size.width + margin, car1.frame.origin.y, viewContainer.frame.size.width / carCount - margin, 73)];
        [car3 setBackgroundColor:[UIColor clearColor]];
        [viewContainer addSubview:car3];
        [car3 addTarget:self action:@selector(handleCarChanged:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton* car4 = [[UIButton alloc] initWithFrame:CGRectMake(car3.frame.origin.x + car3.frame.size.width + margin, car1.frame.origin.y, viewContainer.frame.size.width / carCount, 73)];
        [car4 setBackgroundColor:[UIColor clearColor]];
        [viewContainer addSubview:car4];
        [car4 addTarget:self action:@selector(handleCarChanged:) forControlEvents:UIControlEventTouchUpInside];
        int sexCount = 2;
        //选择性别
        UIButton* sex1 = [[UIButton alloc] initWithFrame:CGRectMake(0, car1.frame.origin.y + car1.frame.size.height + margin, viewContainer.frame.size.width / sexCount - (sexCount - 1) * margin, 50)];
        [sex1 setBackgroundColor:[UIColor clearColor]];
        [sex1 addTarget:self action:@selector(handleSexChanged:) forControlEvents:UIControlEventTouchUpInside];
        [viewContainer addSubview:sex1];
        
        UIButton* sex2 = [[UIButton alloc] initWithFrame:CGRectMake(sex1.frame.origin.x + sex1.frame.size.width + margin, car1.frame.origin.y + car1.frame.size.height + margin, viewContainer.frame.size.width / sexCount - (sexCount - 1) * margin, 50)];
        [sex2 setBackgroundColor:[UIColor clearColor]];
        [sex2 addTarget:self action:@selector(handleSexChanged:) forControlEvents:UIControlEventTouchUpInside];
        [viewContainer addSubview:sex2];
        
        [self handleSexChanged:sex1];
        [self handleCarChanged:car1];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    if(self.orderID == nil){
        return;
    }
    
    [self.orderDelegate handleWaitingOrder:self.orderID];
    
    [self dismissViewControllerAnimated:NO completion:nil];
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
    
    
    [TheDarkPortal commitOrder:[NSNumber numberWithInt:0] onSucceed:^(NSMutableDictionary* succeed){
        
        
        NSString* orderID = [succeed orderdetail_orderID];
        self.orderID = orderID;
    }onFailure:^(NSMutableDictionary* status){
        
    }];
    
    TaxiPickingUpOrder* vc = [TaxiPickingUpOrder new];
    [self presentViewController:vc animated:YES completion:^{
    }];
}

-(void)handleSexChanged:(id)sender {
    UIButton* btn = (UIButton*)sender;
    [self.carSelection removeFromSuperview];
    
    [self.carSelection setFrame:CGRectMake(btn.frame.size.width - 20, 5, self.carSelection.image.size.width, self.carSelection.image.size.width)];
    [btn addSubview:self.carSelection];
}

-(void)handleCarChanged:(id)sender {
    UIButton* btn = (UIButton*)sender;
    [self.sexSelection removeFromSuperview];
    
    [self.sexSelection setFrame:CGRectMake(btn.frame.size.width - 20, 5, self.sexSelection.image.size.width, self.sexSelection.image.size.width)];
    [btn addSubview:self.sexSelection];
    
}

-(void)handleDateTouched:(id)sender {
    int margin = 20;
    
    UIDatePicker* picker = [UIDatePicker new];
    self.picker = picker;
    [picker setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    
    UIButton* settingbackground = [[UIButton alloc] initWithFrame:self.view.bounds];
    [settingbackground addTarget:self action:@selector(handleTouchOutside:) forControlEvents:UIControlEventTouchUpInside];
    [settingbackground setBackgroundColor:RGBA(171,171,171, 0.5)];
    [self.view addSubview:settingbackground];
    self.calBackgounrd = settingbackground;

    int height = picker.frame.size.height;
    int width = settingbackground.frame.size.width;

    int controlHeight = 30;
    CGRect pos2 = CGRectMake(0, settingbackground.frame.size.height - picker.frame.size.height - controlHeight, width, height + controlHeight);
    CGRect pos1 = CGRectMake(0, settingbackground.frame.size.height + height + controlHeight, width, height + controlHeight);
    UIView* setting = [[UIView alloc] initWithFrame:pos1];
    [setting setBackgroundColor:RGB(255,255,255)];
    [settingbackground addSubview:setting];

    {
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, controlHeight)];
        [view setBackgroundColor:[UIColor whiteColor]];
        picker.frame = CGRectMake(0, controlHeight, width, height);
        [picker setDatePickerMode:UIDatePickerModeDateAndTime];
        
        {
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 60, 3, 50, 30)];
            [btn setTitle:@"确定" forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(handleTouchCal:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
        }
        
        {
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 3, 50, 30)];
            [btn setTitle:@"取消" forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(handleTouchCal:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:btn];
        }
        {
            UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 33, view.frame.size.width, 1)];
            [line setBackgroundColor:RGB(171, 171, 171)];
            [view addSubview:line];
        }
        
        [setting addSubview:view];
        [setting addSubview:picker];
    }

    [UIView animateWithDuration:0.2 animations:^{
        setting.frame = pos2;
    } completion:^(BOOL finished){

    }];
    self.calSelector = setting;
}

-(void)handleTouchCal:(id)sender {
    NSDate* date = [self.picker date];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 hh:mm"];
    
    [self.pickingDate setText: [formatter stringFromDate:date]];
    [self handleTouchOutside:sender];
}

-(void)handleTouchOutside:(id)sender {
    if(self.calSelector == nil){
        return;
    }
    [UIView animateWithDuration:1 animations:^{
        self.calSelector.frame = CGRectMake(0, self.view.frame.size.height + self.calSelector.frame.size.height, self.calSelector.frame.size.width, self.calSelector.frame.size.height);
        [self.calBackgounrd setAlpha:0];
    } completion:^(BOOL finished){
        if(finished){
            [self.calBackgounrd removeFromSuperview];
            self.calBackgounrd = nil;
            self.calSelector = nil;
        }
    }];
}

#pragma mark TextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if(textField == self.flightNo){
        [self.pickingUpStart setText:@"曼谷素万那普机场"];
    }else if(textField == self.pickingUpEnd){
        [self.pickingUpEnd setText:@"曼谷莲花大酒店"];
    }
    return NO;
}
@end
