//
//  DungeonsVC.m
//  Horde
//
//  Created by junwen.wu on 14-7-17.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "DungeonsVC.h"

@interface DungeonsVC ()

@end

@implementation DungeonsVC

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
    
    CGFloat barHeight = self.tabBarHeight;
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    
//    UIImage* image = [UIImage imageNamed:@"app_bg.png"];
    UIImageView* background = [[UIImageView alloc] initWithFrame:self.view.frame];
//    [background setImage:image];
    [self.view addSubview:background];
    self.view.backgroundColor = [UIColor colorWithRed:234.0/255.0 green:72.0/255.0 blue:41.0/255.0 alpha:1];
    
    UIView* navigationbar = [[UIView alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width, NAVIGATIONBAR_HEIGHT)];
    [self.view addSubview:navigationbar];
    
    UIView* container = [[UIView alloc] initWithFrame:CGRectMake(0, navigationbar.frame.origin.y + navigationbar.frame.size.height, navigationbar.frame.size.width, self.view.frame.size.height - navigationbar.frame.origin.y - navigationbar.frame.size.height - barHeight)];
    [self.view addSubview:container];
    
    self.container_bar = navigationbar;
    self.container_body = container;
    
    [self setEdge:self.view view:self.container_body attr:NSLayoutAttributeLeft constant:0];
    [self setEdge:self.view view:self.container_body attr:NSLayoutAttributeRight constant:0];
    [self setEdge:self.view view:self.container_body attr:NSLayoutAttributeBottom constant:0];
    self.container_body.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.container_body
                              attribute:NSLayoutAttributeTop
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.container_bar
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0 constant:0]];
    
    [[Orgrimar instance] addObserver:self forKeyPath:@"LANG_BUNDLE" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    
    // 导航控件
    {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont boldSystemFontOfSize: 18];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [label sizeToFit];
        
        CGRect frame = label.frame;
        frame.size.width = frame.size.width + 20.0f;
        frame.size.height = frame.size.height + 10.0f;
        
        frame.origin.x = (self.container_bar.center.x) - frame.size.width / 2;
        frame.origin.y = (self.container_bar.frame.size.height - frame.size.height ) / 2;
        label.frame = frame;
        
        [[self container_bar] addSubview:label];
        
        self.nav_title = label;
    }
    
    // 回退
    {
        UIButton* btnBack = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 44, 44)];
        UIImage* back = [UIImage imageNamed:@"minback.png"];
        [btnBack addTarget:self action:@selector(onBackTouched:) forControlEvents:UIControlEventTouchUpInside];
        [btnBack setImage:back forState:UIControlStateNormal];
        [btnBack setHidden:YES];
        [[self container_bar] addSubview:btnBack];
        
        self.nav_back = btnBack;
    }
    [self.view bringSubviewToFront:self.container_bar];
    
//    [[Orgrimar instance] willChangeValueForKey:@"LANG_BUNDLE"];
//    [[Orgrimar instance] didChangeValueForKey:@"LANG_BUNDLE"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"LANG_BUNDLE"])
    {
        NSBundle* b = [change valueForKey:@"new"];
        [self handleLanguageChanged:b];
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

-(void) onBackTouched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setEdge:(UIView*)superview view:(UIView*)view attr:(NSLayoutAttribute)attr constant:(CGFloat)constant
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:attr relatedBy:NSLayoutRelationEqual toItem:superview attribute:attr multiplier:1.0 constant:constant]];
}


-(void) navigationWithTitle:(NSString*) title
               isHiddenBack:(BOOL) hiddenBack {
    [self.nav_title setText:title];
    [self.nav_title sizeToFit];
    
    CGRect frame = self.nav_title.frame;
    frame.size.width = frame.size.width + 20.0f;
    frame.size.height = frame.size.height + 10.0f;
    
    frame.origin.x = (self.container_bar.center.x) - frame.size.width / 2;
    frame.origin.y = (self.container_bar.frame.size.height - frame.size.height ) / 2;
    self.nav_title.frame = frame;
    
    [self.nav_back setHidden:hiddenBack];
}

-(void) handleLanguageChanged:(NSBundle*) bundle {
    
}
@end
