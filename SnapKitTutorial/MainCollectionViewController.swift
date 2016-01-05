//
//  MainCollectionViewController.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/4/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNibs()
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .Horizontal
        collectionView?.collectionViewLayout = flow
    }
    
    func registerNibs() {
//        let timerCell = UINib(nibName: TimerCell.identifier, bundle:nil)
//        collectionView?.registerNib(timerCell, forCellWithReuseIdentifier: TimerCell.identifier)
        
        collectionView?.registerClass(TimerCellRefactored.self, forCellWithReuseIdentifier: TimerCellRefactored.identifier)
        
        let animationCell = UINib(nibName: AnimationCell.idenitifier, bundle: nil)
        collectionView?.registerNib(animationCell, forCellWithReuseIdentifier: AnimationCell.idenitifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TimerCellRefactored.identifier, forIndexPath: indexPath) as! TimerCellRefactored
            cell.startTimer()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(AnimationCell.idenitifier, forIndexPath: indexPath) as! AnimationCell
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
