//
//  WypHttpTask.h
//
//  Created by 邬一平 on 14-9-4.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WypTaskDelegate.h"

@interface WypHttpTask : NSObject

@property (nonatomic, assign)NSInteger taskId;
@property (nonatomic, weak)id<WypTaskDelegate> delegate;

- (id)initWithId:(NSInteger)__id withDelegate:(id<WypTaskDelegate>)__delegate;

@end
