//
//  TimerCellRefactored.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/5/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import UIKit
import SnapKit

class TimerCellRefactored: UICollectionViewCell {
    static let identifier = "TimerCellRefactored"
    
    var timer = NSTimer() //make a timer variable, but do do anything yet
    let timeInterval:NSTimeInterval = 00.05
    let timerEnd:NSTimeInterval = 0.0
    var timeCount:NSTimeInterval = 3.0
    
    private lazy var minutesLabel:UILabel = {
        let _label              = UILabel(frame: .zero)
        _label.font             = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
        _label.textColor        = UIColor.whiteColor()
        self.contentView.addSubview(_label)
        return _label
    }()
    private lazy var secondsLabel: UILabel = {
        let _label              = UILabel(frame: .zero)
        _label.font             = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
         _label.textColor       = UIColor.whiteColor()
        self.contentView.addSubview(_label)
        return _label
    }()
    private lazy var microSecondsLabel: UILabel = {
        let _label              = UILabel(frame: .zero)
        _label.font             = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
         _label.textColor       = UIColor.whiteColor()
        self.contentView.addSubview(_label)
        return _label
    }()
    
    private lazy var doneLabel: UILabel = {
        let _label              = UILabel(frame: .zero)
        _label.font             = UIFont(name: "HelveticaNeue-UltraLight", size: 35.0)
        _label.text             = "ALL DONE!"
        _label.textColor        = UIColor.whiteColor()
        _label.textAlignment    = .Center
        self.contentView.addSubview(_label)
        return _label
    }()
    
    override func updateConstraints() {
        secondsLabel.snp_updateConstraints { (make) -> Void in
            make.center.equalTo(self.contentView)
        }
        minutesLabel.snp_updateConstraints { (make) -> Void in
            make.centerY.equalTo(secondsLabel)
            make.right.equalTo(secondsLabel.snp_left).offset(-1.0)
        }
        microSecondsLabel.snp_updateConstraints { (make) -> Void in
            make.centerY.equalTo(secondsLabel)
            make.left.equalTo(secondsLabel.snp_right).offset(1.0)
        }
        super.updateConstraints()
    }
    
    func startTimer() {
        if !timer.valid{ //prevent more than one timer on the thread
            timeCount = 3.0
            setTimerLabels()
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval,
                target: self,
                selector: "timerDidEnd:",
                userInfo: "Timer Done!!",
                repeats: true) //repeating timer in the second iteration
        }
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    func stopTimer() {
        //timerLabel.text = "Timer Stopped"
        timer.invalidate()
    }
    
    func timerDidEnd(timer:NSTimer){
        //timerLabel.text = timer.userInfo as? String
        timeCount = timeCount - timeInterval
        if timeCount <= 0 {  //test for target time reached.
            addDoneLabel()
            timer.invalidate()
        } else { //update the time on the clock if not reached
            setTimerLabels()
        }
    }
    
    func setTimerLabels() {
        let (minute, seconds, fractionSecond) = HelperFunctions.timeString(timeCount)
        minutesLabel.text = minute
        secondsLabel.text = seconds
        microSecondsLabel.text = fractionSecond
    }
    
    func addDoneLabel() {
        minutesLabel.hidden = true
        secondsLabel.hidden = true
        microSecondsLabel.hidden = true
        
        doneLabel.snp_updateConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    
}
