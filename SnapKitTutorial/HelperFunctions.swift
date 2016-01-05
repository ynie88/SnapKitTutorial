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

}

extension UIColor {
    static func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}