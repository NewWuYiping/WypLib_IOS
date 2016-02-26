//
//  WypNavigationController.h
//
//  Created by 邬一平 on 14-9-1.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WypNavigationController : UINavigationController<UINavigationControllerDelegate>

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                     black:(dispatch_block_t)__actionBlock;

@end
