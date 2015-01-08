//
//  IMObjectiveBasedViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMObjectiveBasedViewController: UITableViewController {

	internal var objective: IMObjective! {
		get {
			if let objectiveData = self.segueOptions.value as? IMObjective {
				return objectiveData
			}
			return nil
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
