//
//  UIColor+WCAdditions.h
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/3/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WCAdditions)

+ (UIColor *)colorWithHex:(uint32_t)hex;
+ (UIColor *)colorWithDecimalRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithPatternImageNamed:(NSString *)imageName;

@end
