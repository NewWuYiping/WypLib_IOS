//
//  WypTaskDelegate.h
//
//  Created by 邬一平 on 14-9-4.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WypTaskDelegate <NSObject>
@required
- (void)faildWithTaskId:(NSInteger)__taskId data:(id)__id;
- (void)successWithTaskId:(NSInteger)__taskId data:(id)__id;

@optional
- (void)onPreExecuteWithTaksId:(NSInteger)__taskId;
- (void)onProgressUpdateWithTaksId:(NSInteger)__taskId data:(NSArray *)__data;
@end
