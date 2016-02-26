//
//  WypHttpUtils.m
//  封装CNO Task
//
//  Created by 邬一平 on 14-8-17.
//  Copyright (c) 2014年 邬一平. All rights reserved.
//

#import "WypHttpUtils.h"
#import "WypDeviceTools.h"

@implementation WypHttpUtils

+(void)getJson4PostWithURL: (NSURL *) __url
                    params:(NSDictionary *) __data
         completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) __handler{
    
    NSMutableArray *__array = [[NSMutableArray alloc] init];
    [__data enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [__array addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    
    NSMutableString *__body = [[NSMutableString alloc] init];
    long __count = [__array count];
    for (int i=0; i<__count; i++) {
        [__body appendString:__array[i]];
        if(i < __count-1){
            [__body appendString:@"&"];
        }
    }
    WypLog(@"********************************************************");
    WypLog(@"%@?%@", __url, __body);
    WypLog(@"********************************************************");
    
    NSMutableURLRequest *__request = [NSMutableURLRequest requestWithURL:__url];
    __request.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    __request.HTTPMethod = @"POST";
    __request.HTTPBody = [__body dataUsingEncoding:NSUTF8StringEncoding];
    __request.timeoutInterval = 30;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSURLConnection sendAsynchronousRequest:__request
                                           queue:[[NSOperationQueue alloc] init]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//                                   NSHTTPURLResponse *__httpResponse = (NSHTTPURLResponse *)response;
//                                  NSDictionary *fields = [__httpResponse allHeaderFields];
//                                   NSString *cookie = [fields valueForKey:@"Set-Cookie"];
                                   
                                   NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
                                   for (NSHTTPCookie *cookie in [cookieJar cookies]) {
                                       WypLog(@"------------>>>%@", cookie);
                                   }
                                   
                                   __handler(response, data, connectionError);
                               }];
    });
    
}
@end
