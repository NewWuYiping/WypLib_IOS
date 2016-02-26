//
//  WypHttpUtils.h
//  封装CNO Task
//
//  Created by 邬一平 on 14-8-17.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class YwTaskDelegate;

@interface WypHttpUtils : NSObject

+(void)getJson4PostWithURL: (NSURL *) __url
                          params:(NSDictionary *) __data
               completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;
@end
