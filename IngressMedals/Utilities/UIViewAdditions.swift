//
//  UIViewAdditions.swift
//  eshouroku
//
//  Created by Yamazaki Mitsuyoshi on 11/28/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

import UIKit

extension UIView {
	
	internal class func instantiateWithNibName(nibName: String!) -> UIView {
		return NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)[0] as UIView
	}
	
	internal class func instantiateFromNib() -> UIView {
		return self.instantiateWithNibName(self.className)
	}
	
	internal class var nib: UINib {
		get {
			return UINib(nibName: self.className, bundle: nil)
		}
	}
	
	/**
	そのviewのwidth constraintsを返す（複数ある場合はそのうちのどれか）
	
	:returns: NSLayoutConstraint
	*/
	internal func getWidthConstraint() -> NSLayoutConstraint? {
		
		for constraint in self.constraints() as [NSLayoutConstraint] {
			
			if constraint.firstAttribute != NSLayoutAttribute.Width {
				continue
			}
			if constraint.firstItem as UIView != self {
				continue
			}
			return constraint
		}
		return nil
	}
	
	internal func getHeightConstraint() -> NSLayoutConstraint? {
		
		for constraint in self.constraints() as [NSLayoutConstraint] {
			
			if constraint.firstAttribute != NSLayoutAttribute.Height {
				continue
			}
			if constraint.firstItem as UIView != self {
				continue
			}
			return constraint
		}
		return nil
	}
}
