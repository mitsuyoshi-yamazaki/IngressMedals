//
//  IMMedalListViewController.swift
//  IngressMedals
//
//  Created by Yamazaki Mitsuyoshi on 1/4/15.
//  Copyright (c) 2015 Mitsuyoshi. All rights reserved.
//

import UIKit

class IMMedalCell: UICollectionViewCell {
	
	internal var medalView: IMMedalView!
	
	override func awakeFromNib() {
		super.awakeFromNib()

//		// http://stackoverflow.com/questions/24750158/autoresizing-issue-of-uicollectionviewcell-contentviews-frame-in-storyboard-pro
//		self.contentView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
//		self.contentView.frame = self.bounds

		self.medalView = IMMedalView.instantiateFromNib() as IMMedalView
		self.medalView.frame = self.bounds
		self.medalView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
		self.contentView.addSubview(self.medalView)
	}
}

extension CCHexagonFlowLayout {
	
	internal var radius: CGFloat {
		set {
			var itemSize = CGSizeZero
			
			itemSize.width = newValue * 2.0
			itemSize.height = newValue * cos(CGFloat(M_PI / 6.0)) * 2.0
			
			self.itemSize = itemSize
			
			self.minimumInteritemSpacing = (-30 * newValue) / 80.0
			self.minimumLineSpacing = (10 * newValue) / 80.0
			self.gap = (76.0 * newValue) / 80.0
		}
		get {
			return self.itemSize.width / 2.0
		}
	}
}

class IMObjectiveListViewController: UICollectionViewController, NSFetchedResultsControllerDelegate, CCHexagonDelegateFlowLayout {

	private var fetchedResultsController: NSFetchedResultsController!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.fetchedResultsController = IMObjective.MR_fetchAllSortedBy("updatedAt", ascending: false, withPredicate: nil, groupBy: nil, delegate: self)
		IMObjective.MR_performFetch(self.fetchedResultsController)
		
		let hexagonLayout = self.collectionView!.collectionViewLayout as CCHexagonFlowLayout
		
		hexagonLayout.delegate = self

		hexagonLayout.radius = 30
		
		self.collectionView!.backgroundColor = UIColor(patternImageNamed: "background")		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: <UICollectionViewDataSource>
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.fetchedResultsController.sections!.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as IMMedalCell
		let objective = self.fetchedResultsController.objectAtIndexPath(indexPath) as IMObjective
				
		cell.medalView.setObjective(objective)
		
        return cell
    }

    // MARK: <UICollectionViewDelegate>
	override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		let objective = self.fetchedResultsController.objectAtIndexPath(indexPath) as IMObjective
		self.performSegueWithIdentifier("PresentObjectiveView", sender: self, options: objective)
	}
	
	// MARK: <NSFetchedResultsControllerDelegate>
	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		self.collectionView!.reloadData()
	}
}
