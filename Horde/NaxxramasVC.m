//
//  NaxxramasVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NaxxramasVC.h"
#import "ArachnidQuarterVC.h"
#import "MilitaryQuarterVC.h"
#import "ConstructQuarterVC.h"
#import "PlagueQuarterVC.h"

@interface NaxxramasVC ()

@end

@implementation NaxxramasVC

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
    
    ArachnidQuarterVC* item1 = [ArachnidQuarterVC new];
    MilitaryQuarterVC* item2 = [MilitaryQuarterVC new];
    ConstructQuarterVC* item3 = [ConstructQuarterVC new];
    PlagueQuarterVC* item4 = [PlagueQuarterVC new];
    
    item1.tabBarHeight = self.tabBar.frame.size.height;
    item2.tabBarHeight = self.tabBar.frame.size.height;
    item3.tabBarHeight = self.tabBar.frame.size.height;
    item4.tabBarHeight = self.tabBar.frame.size.height;
    
    IMAGE_SCALE(@"约车_normal");
    
    item1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"叫车" image:IMAGE_SCALE(@"约车_normal") selectedImage:nil];
    item2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"货柜" image:IMAGE_SCALE(@"货柜_normal") selectedImage:nil];
    item3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"退税" image:IMAGE_SCALE(@"退税_normal") selectedImage:nil];
    item4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:IMAGE_SCALE(@"我的_normal") selectedImage:nil];
    
    [self addChildViewController:item1];
    [self addChildViewController:item2];
    [self addChildViewController:item3];
    [self addChildViewController:item4];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
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

// lock direction
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationMaskPortrait);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotate
{
    return YES;
}
@end
