//
//  TaxiOnBoardStorageVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-23.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "TaxiOnBoardStorageVC.h"
#import "TheDarkPortal.h"
#import "StorageItemCell.h"
#import "NSMutableDictionary+OrderDetail.h"

@interface TaxiOnBoardStorageVC ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray* array;
@property (strong, nonatomic) UITableView* tableView;
@end

@implementation TaxiOnBoardStorageVC

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
    
    [self navigationWithTitle:T_(@"TaxiOnBoardStorage_Title") isHiddenBack:NO];
    
//    UIScrollView* scrollview = [[UIScrollView alloc] initWithFrame:self.container_body.bounds];
//    [self.container_body addSubview:scrollview];
    
    self.array = [NSMutableArray new];
    
    UIView* container = self.container_body;
    [container setBackgroundColor:[UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:237.0/255.0 alpha:1.0]];
    
    int topOffset = 0;
    int leftMargin = 20;
    {
        UIView* section = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.container_body.frame.size.width, 120)];
        [section setBackgroundColor:[UIColor whiteColor]];
        [container addSubview:section];
        
        UIImage* image = [UIImage imageNamed:[[self.orderDetail orderdetail_driverinfo] orderdetail_driverinfo_avator]];
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
        [name setText:[[self.orderDetail orderdetail_driverinfo] orderdetail_driverinfo_name]];
        [name setFont:[UIFont systemFontOfSize:15]];
        [section addSubview:name];
        
        UILabel* desc = [UILabel new];
        desc.frame = [UIHelper bottomTo:name.frame margin:10 width:90 height:20];
        [desc setText:[[self.orderDetail orderdetail_driverinfo] orderdetail_driverinfo_carinfo]];
        [desc setFont:[UIFont systemFontOfSize:15]];
        [section addSubview:desc];
        
        UILabel* license = [UILabel new];
        license.frame = [UIHelper rightTo:desc.frame margin:10 width:200 height:20];
        [license setText:[[self.orderDetail orderdetail_driverinfo] orderdetail_driverinfo_license]];
        [license setFont:[UIFont systemFontOfSize:15]];
        [section addSubview:license];
        
        UILabel* tip = [UILabel new];
        tip.frame = [UIHelper bottomTo:portrait.frame margin:15 width:section.frame.size.width - 30 height:25];
        [tip setText:T_(@"TaxiOnBoardStorage_Tip")];
        [tip setFont:[UIFont systemFontOfSize:15]];
        [tip setBackgroundColor:[UIColor colorWithRed:255/255.0 green:213/255.0 blue:59/255.0 alpha:1.0]];
        [tip setTextColor:[UIColor colorWithRed:153/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]];
        [section addSubview:tip];
        
        topOffset += (section.frame.origin.y + section.frame.size.height);
    }
    {
        //下拉列表
        UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, topOffset, container.frame.size.width, container.frame.size.height - topOffset)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.showsVerticalScrollIndicator = NO;
        [tableView setBackgroundColor:[UIColor clearColor]];
        [container addSubview:tableView];
        
        self.tableView = tableView;
    }
    
    {
        //启动时的请求
        [TheDarkPortal queryStorageByID:[NSNumber numberWithInt:0] onSucceed:^(NSMutableDictionary* succeed){
           
            dispatch_async(dispatch_get_main_queue(), ^(void){
                self.array = [StorageItemCell changeToCellArrayWithDictionary:succeed];
                [self.tableView reloadData];
            });
        }onFailure:^(NSMutableDictionary* status){
            
        }];
    }
    
    self.array = [NSMutableArray new];
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

#pragma mark - TableView delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    
    NSMutableDictionary* dict = [self.array objectAtIndex:index];
    //    [self performSegueWithIdentifier:@"goPoiDetail" sender:dict];
    
//    if([dict poicard_traffic] == nil){
//        return;
//    }
//    
//    PoiDetailVC* vc = [PoiDetailVC new];
//    vc.poiCardItem = dict;
//    [self presentViewController:vc animated:YES completion:^(void){
//        
//    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return StorageItemCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"itemCell";
    
    NSInteger index = indexPath.row;
    NSArray* pairItem = [self.array objectAtIndex:index];
    
    StorageItemCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[StorageItemCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    [cell setStorageItems:pairItem];
    return cell;
}

@end
