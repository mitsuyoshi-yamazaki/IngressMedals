//
//  UIColorAdditions.swift
//  eshouroku
//
//  Created by Yamazaki Mitsuyoshi on 10/24/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

import Foundation

extension UIColor {
	
	convenience init(colorCode: String!) {
		self.init(colorCode: colorCode, alpha: 1.0)
	}
	
	convenience init(colorCode: String!, alpha: CGFloat!) {
		
		if colorCode.hasPrefix("#") == false {
			fatalError("invalid color code \(colorCode)")
			// TODO: return nilできる方法を探す
			//			return nil
		}
		
		let index = advance(colorCode.startIndex, 1)
		let actualCode = colorCode.substringFromIndex(index)
		let scanner = NSScanner(string: actualCode)
		
		var hex: CUnsignedLongLong = 0
		
		if scanner.scanHexLongLong(&hex) == false {
			fatalError("invalid color code \(colorCode)")
		}
		
		let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
		let green = CGFloat((hex & 0x00FF00) >> 8)  / 255.0
		let blue = CGFloat(hex & 0x0000FF) / 255.0
		
		self.init(red:red, green:green, blue:blue, alpha:alpha)
	}
}