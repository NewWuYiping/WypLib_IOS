//
//  WypNavDownPushButton.h
//
//  Created by 邬一平 on 15/2/5.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WypNavDownPushButton : UIButton

+ (instancetype)instanceButton;

@property (nonatomic, strong)NSString *upImageSrc;
@property (nonatomic, strong)NSString *downImageSrc;
@property (nonatomic, assign)CGFloat arrowImgWidth;

@end
