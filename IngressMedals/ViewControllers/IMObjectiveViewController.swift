//
//  IMObjectiveViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/5/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMObjectiveViewController: IMObjectiveBasedViewController, NSFetchedResultsControllerDelegate {

	@IBOutlet weak private var progressLabel: UILabel!
	
	private var fetchedResultsController: NSFetchedResultsController!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let predicate = NSPredicate(format: "identifier = %@", self.objective.identifier)
		self.fetchedResultsController = IMObjective.MR_fetchAllSortedBy(nil, ascending: true, withPredicate: predicate, groupBy: nil, delegate: self)
		IMObjective.MR_performFetch(self.fetchedResultsController)
		
		self.title = self.objective.title
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		self.updateInterfaces()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Behavior
	@IBAction private func addProgress(sender: AnyObject!) {
		self.objective.progressValue += 1.0
		NSManagedObjectContext.MR_contextForCurrentThread().MR_saveToPersistentStoreAndWait()
	}

	@IBAction private func addProgressWithEvent(sender: AnyObject!) {
		self.performSegueWithIdentifier("PresentAddEventView", sender: self, options: self.objective)
	}

	@IBAction private func showEventList(sender: AnyObject!) {
		self.performSegueWithIdentifier("ShowEventListView", sender: self, options: self.objective)
	}
	
	// MARK: - User Interface
	private func updateInterfaces() {
		
		self.progressLabel.text = "Progress: \(self.objective.progress!)"
	}
	
	// MARK: - <UITableViewDelegate>
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		switch indexPath.row {
		case 1:
			self.addProgress(self)
		case 2:
			self.addProgressWithEvent(self)
		case 3:
			self.showEventList(self)
		default:
			break
		}
	}
	
	// MARK: - <NSFetchedResultsControllerDelegate>
	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		self.updateInterfaces()
	}
}
