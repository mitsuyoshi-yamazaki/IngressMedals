//
//  ViewControllerUtilities.swift
//  eshouroku
//
//  Created by Yamazaki Mitsuyoshi on 10/24/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

import Foundation

extension UIViewController {
	
	internal class func instantiateWithClassName(className: String!) -> UIViewController? {
		
		if className.hasSuffix("Controller") == false {	// あまり頭が良くないが…
			return nil
		}
		
		let storyBoardName = className.stringByReplacingOccurrencesOfString("Controller", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
		let storyBoard: UIStoryboard? = UIStoryboard(name: storyBoardName, bundle: nil)
		
		return storyBoard?.instantiateInitialViewController() as? UIViewController
	}
	
	/**
	必要なら独自メソッドに上書きする
	
	:returns: viewController
	*/
	internal class func instantiate() -> UIViewController {
		return self.instantiateWithClassName(self.className)!
	}
	

	/**
	LayoutConstraintsを再設定した際のアニメーション実行
	
	:param: animated animated
	:param: duration duration
	*/
	internal func viewLayoutIfNeeded(animated: Bool, duration: NSTimeInterval) {
		
		let animations = { () -> Void in
			self.view.layoutIfNeeded()
			self.setNeedsStatusBarAppearanceUpdate()
		}
		
		if animated {
			UIView.animateWithDuration(duration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations, completion: nil)
		}
		else {
			animations()
		}
	}
	
	/**
	self.navigationController!.navigationItem.titleView に UILabel を設定する
	
	:param: initializer initializer
	*/
	internal func customNavigationTitleLabel() -> UILabel {
		
		let frame = self.navigationController!.navigationBar.bounds
		let titleLabel = UILabel(frame: frame)
		
		titleLabel.backgroundColor = UIColor.clearColor()
		titleLabel.textAlignment = NSTextAlignment.Center
		
		let attributes = self.navigationController!.navigationBar.titleTextAttributes
		
		if let titleColor = attributes?[NSForegroundColorAttributeName] as? UIColor {
			titleLabel.textColor = titleColor
		}
		if let titleFont = attributes?[NSFontAttributeName] as? UIFont {
			titleLabel.font = titleFont
		}
		
		return titleLabel
	}
}
