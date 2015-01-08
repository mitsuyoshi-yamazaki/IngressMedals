//
//  UIViewController+WCAdditions.h
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/2/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIViewControllerの便利クラス
 */
@interface UIViewController (WCAdditions)

/**
 *  dismissViewControllerAnimated:completion: のラッパー
 *
 *  @param sender sender
 */
- (IBAction)dismiss:(id)sender;

/**
 *  [self.navigationController popViewControllerAnimated:] のラッパー
 *
 *  @param sender sender
 */
- (IBAction)pop:(id)sender;

/**
 *  視差エフェクトを返すメソッド
 *
 *  @return UIMotionEffectGroup
 */
- (UIMotionEffectGroup *)parallaxEffect;

/**
 *  初回のviewWillAppearのみ呼ばれる
 */
- (void)firstViewWillAppear:(BOOL)animated;

@end

@interface UINavigationController (WCAdditions)

@property (nonatomic, readonly) UIViewController *rootViewController;

@end