//
//  IMEventListViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/8/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMEventCell: UITableViewCell {
	
	@IBOutlet weak private var medalContainerView: UIView!
	@IBOutlet weak private var titleLabel: UILabel!

	internal var medalView: IMMedalView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		self.medalView = IMMedalView.instantiateFromNib() as IMMedalView
		self.medalView.frame = self.medalContainerView.bounds
		self.medalView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
		self.medalContainerView.addSubview(self.medalView)
	}
}

class IMEventListViewController: IMObjectiveBasedViewController, NSFetchedResultsControllerDelegate {

	private var fetchedResultsController: NSFetchedResultsController!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = self.objective.title
		self.tableView.rowHeight = 44.0
		
		let predicate = NSPredicate(format: "(objective = %@) AND (deletedAt = NULL)", self.objective)
		self.fetchedResultsController = IMEvent.MR_fetchAllSortedBy("progress", ascending: true, withPredicate: predicate, groupBy: nil, delegate: self)	// TODO: メダルによるグルーピング
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - <UITableViewDataSource>
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
		return sectionInfo.numberOfObjects
    }
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as IMEventCell
		let event = self.fetchedResultsController.objectAtIndexPath(indexPath) as IMEvent
		
		cell.medalView.setEvent(event)
		cell.titleLabel.text = event.detail
		
		return cell
	}

	// MARK: - <NSFetchedResultsControllerDelegate>
	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		self.tableView.reloadData()
	}
}
