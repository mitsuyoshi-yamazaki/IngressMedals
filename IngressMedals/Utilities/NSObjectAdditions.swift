//
//  NSObjectAdditions.swift
//  eshouroku
//
//  Created by Yamazaki Mitsuyoshi on 11/25/14.
//  Copyright (c) 2014 Miew Inc. All rights reserved.
//

import Foundation

extension NSObject {
	
	internal class var className: String! {
		get {
			let classIdentifier = NSStringFromClass(self) as NSString
						
			let components = classIdentifier.componentsSeparatedByString(".")
			
			if components.count > 1 {
				// IngressMedals._IMObjective
				let hoge = (components.last as NSString)
				return hoge.componentsSeparatedByString("_").last as NSString!
			}
			else {
				// NSManagedObjectサブクラスは（？）ESEvent_ESEvent_のような形式になる
				// まじなんなの
				return classIdentifier.componentsSeparatedByString("_").first as NSString!
			}
		}
	}
}

internal func ClassFromClassName(className: String!) -> AnyClass? {
	
	let projectName = NSBundle.mainBundle().bundleIdentifier!.componentsSeparatedByString(".").last!
	let contentViewClassName = "\(projectName).\(className)"
	
	// TODO: 存在しないクラスだと落ちる？ 要確認
	return NSClassFromString(contentViewClassName)
}

extension NSBundle {
	
	internal class var applicationVersion: String! {
		get {
			return NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as String!
		}
	}
	
	internal class var applicationVersionFullString: String! {
		get {
			let bundleVersion = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"] as String!
			return "Ver \(self.applicationVersion) (\(bundleVersion))"
		}
	}
}