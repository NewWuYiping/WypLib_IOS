//
//  WypViewController.m
//  Created by 邬一平
//  Copyright (c) 2013年 邬一平. All rights reserved.
//

#import "WypViewController.h"
#import "WypDeviceTools.h"

@interface WypViewController ()

@end

@implementation WypViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([WypDeviceTools wyp_iosVersion] >= 7) {
        return UIStatusBarStyleLightContent;
    }else{

        return [super preferredStatusBarStyle];
    }
    
}

@end
