//
//  IMMedalTableViewCell.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMMedalTableViewCell: UITableViewCell {

	@IBOutlet weak private var medalContainerView: UIView!
	@IBOutlet weak internal var titleLabel: UILabel!
	
	internal var medalView: IMMedalView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.medalView = IMMedalView.instantiateFromNib() as IMMedalView
		self.medalView.frame = self.medalContainerView.bounds
		self.medalView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
		self.medalContainerView.addSubview(self.medalView)
	}
}
