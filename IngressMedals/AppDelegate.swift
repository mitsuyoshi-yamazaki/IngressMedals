//
//  AppDelegate.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 12/28/14.
//  Copyright (c) 2014 Mitsuyoshi. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		
		self.initializeCoreData()
		self.initializeAppearances()
		
		return true
	}

	func applicationWillResignActive(application: UIApplication) {

	}

	func applicationDidEnterBackground(application: UIApplication) {

	}

	func applicationWillEnterForeground(application: UIApplication) {

	}

	func applicationDidBecomeActive(application: UIApplication) {

	}

	func applicationWillTerminate(application: UIApplication) {

	}
	
	// MARK: - Initializations
	private func initializeCoreData() {
		
		MagicalRecord.setupAutoMigratingCoreDataStack()
	}
	
	private func initializeAppearances() {
		
		let navigationBarAppearance = UINavigationBar.appearance()
		
		navigationBarAppearance.barStyle = UIBarStyle.Black
		navigationBarAppearance.barTintColor = UIColor.clearColor()
		
		let lightGreenColor = UIColor(decimalRed: 78, green: 255, blue: 255, alpha: 1.0)
		let titleAttributes = [
			NSForegroundColorAttributeName: lightGreenColor
		]
		
		navigationBarAppearance.titleTextAttributes = titleAttributes
		navigationBarAppearance.tintColor = lightGreenColor
		
		UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
	}
}

