//
//  UIStoryboard+WCAdditions.h
//  kadokawa_ios
//
//  Created by Yamazaki Mitsuyoshi on 10/2/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (WCAdditions)

/**
 *  kadokawa_iosアプリのMain.storyboard内にあるViewControllerをインスタンス化するメソッド
 *
 *  @param viewControllerID ViewControllerのstoryboardID
 *
 *  @return ViewControllerインスタンス
 */
+ (id)instantiateViewControllerInMainStoryboard:(NSString *)viewControllerID;

/**
 *  指定されたViewControllerをインスタンス化するメソッド
 *
 *  @param viewControllerID ViewControllerのstoryboardID
 *  @param storyBoardName   対象のViewControllerを格納しているStoryBoard名
 *
 *  @return ViewControllerインスタンス
 */
+ (id)instantiateViewController:(NSString *)viewControllerID inStoryBoard:(NSString *)storyBoardName;

+ (id)instantiateInitialViewControllerInStoryBoard:(NSString *)storyBoardName;

@end
