//
//  DungeonsVC.h
//  Horde
//
//  Created by junwen.wu on 14-7-17.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "SoloVC.h"
#import "Orgrimar.h"
#import "NSBundle+Language.h"

#define STATUSBAR_HEIGHT 20
#define NAVIGATIONBAR_HEIGHT 40

@interface DungeonsVC : SoloVC

@property (assign, nonatomic) CGFloat tabBarHeight;

@property (strong, nonatomic) UIView* container_bar;
@property (strong, nonatomic) UIView* container_body;

@property (strong, nonatomic) UIButton* nav_back;
@property (strong, nonatomic) UILabel* nav_title;

-(void) navigationWithTitle:(NSString*) title
      isHiddenBack:(BOOL) hiddenBack;

-(void) handleLanguageChanged:(NSBundle*) bundle;
@end
