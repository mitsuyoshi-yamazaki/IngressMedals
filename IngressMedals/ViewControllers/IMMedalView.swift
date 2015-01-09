//
//  IMMedalView.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

/// IB上でIMMedalViewを配置したい時に使うコンテナ
class IMMedalContainerView: UIView {
	
	internal var medalView: IMMedalView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.backgroundColor = UIColor.clearColor()
		
		self.medalView = IMMedalView.instantiateFromNib() as IMMedalView
		
		self.medalView.frame = self.bounds
		self.medalView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
		
		self.addSubview(self.medalView)
	}
}

class IMMedalView: UIView {

	@IBOutlet internal var titleLabel: UILabel!
	@IBOutlet internal var lockView: UIView!
	
	private var borderLayer: CAShapeLayer! = CAShapeLayer()
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.layer.addSublayer(self.borderLayer)
	}
	
	override var frame: CGRect {
		didSet {
			self.setLayerMask()
		}
	}
	
	override var bounds: CGRect {
		didSet {
			self.setLayerMask()
		}
	}
	
	private func setLayerMask() {
				
		let clippingPath = UIBezierPath()
		
		let width = self.bounds.size.width
		let height = self.bounds.size.height
		let radius = width / 2.0
		
		clippingPath.moveToPoint(CGPointMake(radius * 0.5, 0.0))
		clippingPath.addLineToPoint(CGPointMake(radius * 1.5, 0.0))
		clippingPath.addLineToPoint(CGPointMake(width, height * 0.5))
		clippingPath.addLineToPoint(CGPointMake(radius * 1.5, height))
		clippingPath.addLineToPoint(CGPointMake(radius * 0.5, height))
		clippingPath.addLineToPoint(CGPointMake(0.0, height * 0.5))
		clippingPath.closePath()
		
		
		let maskLayer = CAShapeLayer()
		
		maskLayer.path = clippingPath.CGPath
		
		maskLayer.lineJoin = kCALineJoinRound//kCALineJoinMiter
		
		self.layer.mask = maskLayer
		
		self.borderLayer.path = clippingPath.CGPath
		self.borderLayer.fillColor = UIColor.clearColor().CGColor
		self.borderLayer.lineJoin = kCALineJoinMiter
	}
	
	internal func setBorderWithColor(color: UIColor, width: CGFloat) {	// widthは正確な値にならないかも
		
		self.borderLayer.strokeColor = color.CGColor
		self.borderLayer.lineWidth = width
	}

	internal func setObjective(objective: IMObjective) {
		
		let medalType = objective.medalType
		
		self.setMedalType(medalType, text: objective.title!)
		
		self.lockView.hidden = (medalType != IMMedalType.NotStarted)
	}
	
	internal func setEvent(event: IMEvent) {
		
		self.setMedalType(event.medalType, text: "\(event.progress!)")
		self.lockView.hidden = true
	}
	
	internal func setMedalType(medalType: IMMedalType, text: String = "") {
		
		self.titleLabel.text = text
		self.backgroundColor = medalType.backgroundColor()
		self.setBorderWithColor(medalType.borderColor(), width: 4.0)
	}
}
