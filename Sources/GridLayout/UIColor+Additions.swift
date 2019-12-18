//
//  UIColor+Additions.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2019-09-26.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    static func customRandomColor() -> UIColor {
        return customColor(red: UInt8(arc4random() % 255),
                           green: UInt8(arc4random() % 255),
                           blue: UInt8(arc4random() % 255))
    }
    
    static func customColor(red: UInt8, green: UInt8, blue: UInt8) -> UIColor {
        return customColor(red: red, green: green, blue: blue, alpha: 255)
    }
    
    static func customColor(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: CGFloat(alpha) / 255.0)
    }
}
