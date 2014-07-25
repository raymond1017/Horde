//
//  NaxxramasVC.h
//  Horde
//
//  Created by junwen.wu on 14-7-18.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NaxxramasVC : UITabBarController

#define IMAGEVIEW_SCALE(x) [[UIImageView alloc] initWithImage:IMAGE_SCALE(x)]
#define IMAGE_SCALE(x) [UIImage imageWithData:[[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:x ofType:@"png"]] scale:2.0]

@end
