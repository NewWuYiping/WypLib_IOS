//
//  NSData+MD5.h
//  WypLib
//
//  Created by 邬一平 on 15/9/15.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MD5)

//把字符串加密成32位小写md5字符串
+ (NSString*)md532BitLower:(NSString *)inPutText;

//把字符串加密成32位大写md5字符串
+ (NSString*)md532BitUpper:(NSString*)inPutText;

@end
