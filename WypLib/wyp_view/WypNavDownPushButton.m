//
//  WypNavDownPushButton.m
//
//  Created by 邬一平 on 15/2/5.
//  Copyright (c) 2015年 邬一平. All rights reserved.
//

#import "WypNavDownPushButton.h"
#import "UIControl+Wyp.h"
#import "NSString+Wyp.h"
#import "UIViewExt.h"
#define kDefaultImageWidth              30
@interface WypNavDownPushButton()

@end


@implementation WypNavDownPushButton


+ (instancetype)instanceButton {
    WypNavDownPushButton *__returnBtn = [self buttonWithType:UIButtonTypeCustom];
    __returnBtn.adjustsImageWhenHighlighted = NO;
    __returnBtn.imageView.contentMode = UIViewContentModeCenter;
//    __returnBtn.contentMode = UIViewContentModeCenter;
//    __returnBtn.imageView.contentMode = NSTextAlignmentCenter;
    __returnBtn.titleLabel.textAlignment = NSTextAlignmentCenter;//NSTextAlignmentRight;//
    return __returnBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat __width = [self.titleLabel.text wyp_sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, self.height)].width;
    self.titleLabel.frame = CGRectMake((self.width-__width) / 2, 0, __width, self.height);
    self.imageView.frame = CGRectMake(self.titleLabel.right + 1, 0, self.arrowImgWidth, self.height);
//    self.titleEdgeInsets =UIEdgeInsetsMake(0, 0, 0, kDefaultImageWidth);
//    self.imageEdgeInsets = UIEdgeInsetsMake(0, ([self countTitleWidth] + kDefaultImageWidth + 30), 0, 0);
//    self.imageEdgeInsets = UIEdgeInsetsMake(0, __width, 0, 0);
}

/*
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//    NSLog(@"%s", __func__);
    CGFloat __x = CGRectGetMaxX(contentRect) - kDefaultImageWidth;
    CGFloat __w = kDefaultImageWidth;
    CGFloat __y = CGRectGetMinY(contentRect);
    CGFloat __h = CGRectGetMaxY(contentRect);
    return CGRectMake(__x, __y, __w, __h);
    
//    
//    CGFloat __x = self.width - kDefaultImageWidth/2 + [self countTitleWidth]/2;
//    CGFloat __w = kDefaultImageWidth;
//    CGFloat __y = CGRectGetMinY(contentRect);
//    CGFloat __h = CGRectGetMaxY(contentRect);
//    return CGRectMake(__x, __y, __w, __h);
}
 */

//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//        NSLog(@"%s", __func__);
//    CGFloat __x = CGRectGetMinX(contentRect);
//    CGFloat __w = CGRectGetMaxX(contentRect);
//    CGFloat __y = CGRectGetMinY(contentRect);
//    CGFloat __h = CGRectGetMaxY(contentRect);
//    return CGRectMake(__x, __y, __w, __h);
//    CGFloat __w = [self countTitleWidth];
//    CGFloat __x = self.width - (__w + kDefaultImageWidth)/2;
//    CGFloat __y = CGRectGetMinY(contentRect);
//    CGFloat __h = CGRectGetMaxY(contentRect);
//    return CGRectMake(__x, __y, __w, __h);
    
//}


- (CGFloat)countTitleWidth {
    CGSize __size = [self.titleLabel.text wyp_sizeWithFont:self.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, self.height)];
    return __size.width;
}


#pragma mark - get set
- (void)setDownImageSrc:(NSString *)downImageSrc {
    if (_downImageSrc != downImageSrc) {
        _downImageSrc = downImageSrc;
        [self setImage:[UIImage imageNamed:_downImageSrc] forState:UIControlStateNormal];
    }
}

- (void)setUpImageSrc:(NSString *)upImageSrc {
    if (_upImageSrc != upImageSrc) {
        _upImageSrc = upImageSrc;
        [self setImage:[UIImage imageNamed:_upImageSrc] forState:UIControlStateSelected];
    }
}

- (CGFloat)arrowImgWidth {
    if (_arrowImgWidth < 1) {
        _arrowImgWidth =  kDefaultImageWidth;
    }
    return _arrowImgWidth;
}

@end
