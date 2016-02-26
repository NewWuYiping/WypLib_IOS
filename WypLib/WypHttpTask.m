//
//  WypHttpTask.m
//
//  Created by 邬一平 on 14-9-4.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypHttpTask.h"

@implementation WypHttpTask

- (id)initWithId:(NSInteger)__id withDelegate:(id<WypTaskDelegate>)__delegate {
    if (self = [super init]) {
        self.delegate = __delegate;
        self.taskId = __id;
    }
    return self;
}
@end
