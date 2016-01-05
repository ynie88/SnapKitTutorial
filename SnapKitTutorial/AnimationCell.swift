//
//  AnimationCell.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/4/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import UIKit

class AnimationCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet var button: UIButton!
    @IBOutlet var buttonCenterXConstraint: NSLayoutConstraint!
    
    static let idenitifier = "AnimationCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: "imageTapped")
        gesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(gesture)
        contentView.backgroundColor = UIColor.getRandomColor()
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        buttonCenterXConstraint.constant = 50
        UIView.animateWithDuration(2.0) { () -> Void in
            self.layoutIfNeeded()
        }
    }
    
    func imageTapped() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0.0
        rotation.toValue           = CGFloat(M_1_PI * 2.0)
        rotation.duration          = 1.0
        rotation.autoreverses      = true
        imageView.layer.addAnimation(rotation, forKey: nil)
    }

}
