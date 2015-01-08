//
//  UIColor+WCAdditions.m
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/3/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import "UIColor+WCAdditions.h"

@implementation UIColor (WCAdditions)

+ (UIColor *)colorWithHex:(uint32_t)hex {
	
	uint16_t redHex = (hex >> 16) & 0xff;
	uint16_t greenHex = (hex >> 8) & 0xff;
	uint16_t blueHex = (hex >> 0) & 0xff;
	
	CGFloat red = (CGFloat)redHex / 255.0f;
	CGFloat green = (CGFloat)greenHex / 255.0f;
	CGFloat blue = (CGFloat)blueHex / 255.0f;
	
	return [self colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (UIColor *)colorWithDecimalRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue alpha:(CGFloat)alpha {
	
	CGFloat redFloat = (CGFloat)red / 255.0f;
	CGFloat greenFloat = (CGFloat)green / 255.0f;
	CGFloat blueFloat = (CGFloat)blue / 255.0f;
	
	return [self colorWithRed:redFloat green:greenFloat blue:blueFloat alpha:alpha];
}

+ (UIColor *)colorWithPatternImageNamed:(NSString *)imageName {
	UIImage *backgroundImage = [UIImage imageNamed:imageName];
	return [self colorWithPatternImage:backgroundImage];
}

@end
