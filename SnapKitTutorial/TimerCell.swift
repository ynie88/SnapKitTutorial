//
//  TimerCell.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/4/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import UIKit

class TimerCell: UICollectionViewCell {
    static let identifier = "TimerCell"

    @IBOutlet var minutesLabel: UILabel!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var microSecondsLabel: UILabel!
    
    var timer = NSTimer() //make a timer variable, but do do anything yet
    let timeInterval:NSTimeInterval = 00.05
    let timerEnd:NSTimeInterval = 0.0
    var timeCount:NSTimeInterval = 3.0
    
    //MARK: - Actions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minutesLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
        secondsLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
        microSecondsLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 31.0)
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
    }
    
    func stopTimer() {
        //timerLabel.text = "Timer Stopped"
        timer.invalidate()
    }
    
    func timeString(time:NSTimeInterval) -> (String, String, String) {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let secondsFraction = seconds - Double(Int(seconds))
        let strMinutes = String(format: "%02i", minutes)
        let strSeconds = String(format: ":%02i", Int(seconds))
        let strSecondsFraction = String(format: "%.01i",Int(secondsFraction * 10.0))
        return (strMinutes, strSeconds, strSecondsFraction)
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
    
    func addDoneLabel() {
        minutesLabel.hidden = true
        secondsLabel.hidden = true
        microSecondsLabel.hidden = true
        
        let doneLabel = UILabel(frame: .zero)
        doneLabel.textColor = UIColor.blueColor()
        doneLabel.textAlignment = .Center
        doneLabel.text = "All Done!"
        contentView.addSubview(doneLabel)
        doneLabel.translatesAutoresizingMaskIntoConstraints = false
        doneLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 35.0)
        doneLabel.sizeToFit()
        
        let centerX = NSLayoutConstraint(item: doneLabel, attribute: .CenterX, relatedBy: .Equal, toItem: contentView, attribute: .CenterX, multiplier: 1.0, constant: 0.0)
        let centerY = NSLayoutConstraint(item: doneLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        
        contentView.addConstraints([centerX, centerY])
    }
    
    func setTimerLabels() {
        let (minute, seconds, fractionSecond) = timeString(timeCount)
        minutesLabel.text = minute
        secondsLabel.text = seconds
        microSecondsLabel.text = fractionSecond
    }
}
