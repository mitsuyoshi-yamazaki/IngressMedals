//
//  UIStoryboard+WCAdditions.m
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/2/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import "UIStoryboard+WCAdditions.h"

@implementation UIStoryboard (WCAdditions)

+ (id)instantiateViewControllerInMainStoryboard:(NSString *)viewControllerID {
	return [self instantiateViewController:viewControllerID inStoryBoard:@"Main"];
}

+ (id)instantiateViewController:(NSString *)viewControllerID inStoryBoard:(NSString *)storyBoardName {
	
	UIStoryboard *storyBoard = [self storyboardWithName:storyBoardName bundle:nil];
	return [storyBoard instantiateViewControllerWithIdentifier:viewControllerID];
}

+ (id)instantiateInitialViewControllerInStoryBoard:(NSString *)storyBoardName {

	UIStoryboard *storyBoard = [self storyboardWithName:storyBoardName bundle:nil];
	return [storyBoard instantiateInitialViewController];
}

@end
