//
//  AnimationCellRefactored.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/5/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import UIKit

class AnimationCellRefactored: UICollectionViewCell {
    static let identifier = "AnimationCellRefactored"
    var _offset = 40
    private var offset:Int {
        get {
            if _offset == 0 {
                _offset = 40
            } else {
                _offset = 0
            }
            return _offset
        }
    }
    
    private lazy var button:UIButton = {
        let button                  = UIButton(frame: .zero)
        button.titleLabel?.font     = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.setTitle("Press Me!", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonPressed", forControlEvents: .TouchUpInside)
        self.contentView.addSubview(button)
        return button
    }()
    
    private lazy var imageContainer:UIView = {
        let container = UIView(frame: .zero)
        self.contentView.addSubview(container)
        return container
    }()
    
    private lazy var imageView:UIImageView = {
        let _image                          = UIImage(named: "logo")
        let imageView                       = UIImageView(frame: .zero)
        imageView.image                     = _image
        imageView.contentMode               = UIViewContentMode.ScaleAspectFit
        imageView.userInteractionEnabled    = true
        imageView.addGestureRecognizer(self.imageTouch)
        self.imageContainer.addSubview(imageView)
        return imageView
    }()
    
    private lazy var imageTouch:UITapGestureRecognizer = {
        let tap                     = UITapGestureRecognizer(target: self, action: "imageTapped")
        tap.numberOfTapsRequired    = 1
        return tap
    }()
    
    private lazy var rotationAnimation:CABasicAnimation = {
        let _rotation = CABasicAnimation(keyPath: "transform.rotation")
        _rotation.fromValue         = 0.0
        _rotation.toValue           = CGFloat(M_1_PI * 2.0)
        _rotation.duration          = 1.0
        _rotation.autoreverses      = true
        return _rotation
    }()
    
    func setupCell() {
        self.contentView.backgroundColor = UIColor.whiteColor()
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        imageContainer.snp_updateConstraints { (make) -> Void in
            make.center.equalTo(self.contentView)
            make.width.equalTo(155)
            make.height.equalTo(imageContainer.snp_width)
        }
        
        imageView.snp_updateConstraints { (make) -> Void in
            make.edges.equalTo(imageContainer)
        }
        
        button.snp_updateConstraints { (make) -> Void in
            make.bottom.equalTo(self.contentView).offset(-10.0)
            make.centerX.equalTo(self.contentView)
        }
        
        super.updateConstraints()
    }
    
    func imageTapped() {
        imageView.layer.addAnimation(self.rotationAnimation, forKey: nil)
    }
    
    func buttonPressed() {
        self.button.snp_updateConstraints(closure: { (make) -> Void in
            make.centerX.equalTo(self.contentView).offset(offset)
        })
        
        UIView.animateWithDuration(1.0) { () -> Void in
            self.contentView.layoutIfNeeded()
        }
    }
}
