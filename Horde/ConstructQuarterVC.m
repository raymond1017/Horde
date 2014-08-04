//
//  ConstructQuarterVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "ConstructQuarterVC.h"
#import "TaxiPickingUpCompletedVC.h"

@interface ConstructQuarterVC ()

@end

@implementation ConstructQuarterVC

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
    
    [self navigationWithTitle:T_(@"Tab_3") isHiddenBack:YES];
    
    UIImageView* view = IMAGEVIEW_SCALE(@"订单 2");
    [scrollview setContentSize:view.image.size];
    
    UIButton* fakeButton = [[UIButton alloc] initWithFrame:view.bounds];
    [fakeButton addSubview:view];
    [fakeButton addTarget:self action:@selector(handleOrderClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [container addSubview:fakeButton];
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

- (void) handleOrderClicked:(id)sender {
    if(self.orderID == nil)
        return;
    
    TaxiPickingUpCompletedVC* vc = [TaxiPickingUpCompletedVC new];
    vc.orderID = self.orderID;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
