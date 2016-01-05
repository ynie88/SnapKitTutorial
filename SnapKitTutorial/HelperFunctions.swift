//
//  HelperFunctions.swift
//  SnapKitTutorial
//
//  Created by Yuchen Nie on 1/4/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import Foundation
import UIKit

struct HelperFunctions {
    static func timeString(time:NSTimeInterval) -> (String, String, String) {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let secondsFraction = seconds - Double(Int(seconds))
        let strMinutes = String(format: "%02i", minutes)
        let strSeconds = String(format: ":%02i", Int(seconds))
        let strSecondsFraction = String(format: "%.01i",Int(secondsFraction * 10.0))
        return (strMinutes, strSeconds, strSecondsFraction)
    }
}

extension UIColor {
    static func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}