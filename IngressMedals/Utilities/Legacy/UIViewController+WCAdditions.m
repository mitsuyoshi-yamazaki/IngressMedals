//
//  UIViewController+WCAdditions.m
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/2/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import "UIViewController+WCAdditions.h"
#import <objc/runtime.h>

#import "Aspects.h"

@interface UIViewController (WCAdditionsPrivate)

@property (nonatomic, strong) NSNumber *viewAppeared;

@end

@implementation UIViewController (WCAdditions)

+ (void)load {
	
	[UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id <AspectInfo> aspectInfo, BOOL animated){
		
		UIViewController *viewController = aspectInfo.instance;
		
		if (viewController.viewAppeared.boolValue == NO) {
			[viewController firstViewWillAppear:animated];
		}
		
	} error:NULL];
}

- (void)setViewAppeared:(NSNumber *)viewAppeared {
	objc_setAssociatedObject(self, _cmd, viewAppeared, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)viewAppeared {
	return objc_getAssociatedObject(self, @selector(setViewAppeared:));
}

- (void)firstViewWillAppear:(BOOL)animated {
	
	self.viewAppeared = @(YES);
}

#pragma mark - Behavior
- (IBAction)dismiss:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)pop:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Parallax
- (UIMotionEffectGroup *)parallaxEffect {

	// http://stackoverflow.com/questions/18972994/ios-7-parallax-effect-in-my-view-controller
	NSInteger relativeValue = 20;
	
	UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
	verticalMotionEffect.minimumRelativeValue = @(-relativeValue);
	verticalMotionEffect.maximumRelativeValue = @(relativeValue);
	
	UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
	horizontalMotionEffect.minimumRelativeValue = @(-relativeValue);
	horizontalMotionEffect.maximumRelativeValue = @(relativeValue);
	
	UIMotionEffectGroup *group = [UIMotionEffectGroup new];
	group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];

	return group;
}

@end

@implementation UINavigationController (WCAdditions)

@dynamic rootViewController;

- (UIViewController *)rootViewController {
	return self.viewControllers[0];
}

@end
