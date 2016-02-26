//
//  NSDate+Wyp.h
//  纳税服务
//
//  Created by 邬一平 on 14-9-26.
//  Copyright (c) 2014年 伊文科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#define Date1970(VALUE) ([NSDate dateWithTimeIntervalSince1970:VALUE/1000])

@interface NSDate (Wyp)
- (void)wyp_logDate;
- (NSString *)wyp_stringFromDate:(NSString *)__dateFormat;
//时间戳转换为时间
+ (NSString *)wyp_stringFromDateStr:(NSString *)dateStr dateFormat:(NSString *)__dateFormatter;
@end
