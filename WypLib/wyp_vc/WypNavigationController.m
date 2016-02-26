//
//  WypNavigationController.m
//
//  Created by 邬一平 on 14-9-1.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypNavigationController.h"
#import <objc/runtime.h>

@interface WypNavigationController ()
//@property (nonatomic,copy) dispatch_block_t completionBlock;
@end

@implementation WypNavigationController



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
}

static char overviewKey;
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                     black:(dispatch_block_t)__actionBlock{
    objc_setAssociatedObject(self, &overviewKey, __actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = self;
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    dispatch_block_t ___block = (dispatch_block_t)objc_getAssociatedObject(self, &overviewKey);
    if (___block) {
        ___block();
    }
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    
}
@end
