//
//  IMAddMedalViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/4/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMMedalImputCell: UITableViewCell {
	
	@IBOutlet internal var progressTextField: UITextField!
}

class IMAddObjectiveViewController: UITableViewController {

	@IBOutlet private var doneButton: UIBarButtonItem!
	@IBOutlet private var titleTextField: UITextField!
	@IBOutlet private var detailTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		let becameFirstResponder = self.titleTextField.becomeFirstResponder()
		assert(becameFirstResponder, "なるはず")
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		// TODO:
//		self.doneButton.enabled = false
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// MARK: - Behavior
	@IBAction private func done(sender: AnyObject!) {
		
		if self.createObjective() {
			self.dismiss(self)
		}
		else {
			let alertView = UIAlertView(title: "Alert", message: "Failed", delegate: nil, cancelButtonTitle: "OK")
			alertView.show()
		}
	}
	
	// MARK: - Data
	/// 作れたらtrue
	private func createObjective() -> Bool {
		
		let objective = IMObjective.createData() as IMObjective
		
		objective.title = self.titleTextField.text
		objective.detail = self.detailTextField.text
		
		let notStartedMedal = IMMedal.createData() as IMMedal
		notStartedMedal.type = IMMedalType.NotStarted.rawValue
		notStartedMedal.progress = IMMedalType.notStartedProgress()
		
		objective.addMedalsObject(notStartedMedal)
		
		let max = IMMedalType.count() - IMMedalType.Copper.rawValue
		
		for index in 1...max {
			
			let indexPath = NSIndexPath(forRow: index - 1, inSection: 1)
			let cell = self.tableView.cellForRowAtIndexPath(indexPath) as IMMedalImputCell!
						
			let progressText = cell.progressTextField.text as NSString!
			
			let medal = IMMedal.createData() as IMMedal
			
			medal.type = index
			medal.progress = progressText.doubleValue
			
			objective.addMedalsObject(medal)
		}

		if self.validateObjective(objective) {
			
			NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
			return true
		}
		return false
	}
	
	private func validateObjective(objective: IMObjective) -> Bool {

		// TODO:
		
		if (objective.title == nil) || (countElements(objective.title!) == 0) {
			return false
		}
		
		return true
	}
}
