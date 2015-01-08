//
//  UITableViewCellAdditions.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

extension UITableViewCell {
	
	internal class func registerTo(tableView: UITableView!) {
		
		tableView.registerClass(self, forCellReuseIdentifier: self.className)
		tableView.registerNib(self.nib, forCellReuseIdentifier: self.className)
	}
}