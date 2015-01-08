//
//  IMAddEventViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMAddEventViewController: IMObjectiveBasedViewController {

	@IBOutlet private var detailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		let becameFirstResponder = self.detailTextField.becomeFirstResponder()
		assert(becameFirstResponder, "なるはず")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Behavior
	@IBAction private func done(sender: AnyObject!) {
		
		self.createEvent()
		
		NSManagedObjectContext.MR_contextForCurrentThread().MR_saveToPersistentStoreAndWait()
		
		self.dismiss(self)
	}
	
	// MARK: - Data
	private func createEvent() {
		
		let detail: NSString? = self.detailTextField.text
		
		if detail?.length != 0 {
			
			let event = IMEvent.createData() as IMEvent
			
			event.detail = detail
			event.objective = self.objective
			
			self.objective.progressValue += 1.0

			event.progress = self.objective.progress
		}
	}
}
