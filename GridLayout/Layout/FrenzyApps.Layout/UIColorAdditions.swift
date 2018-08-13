//
//  UIColorAdditions.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public static func customRandomColor() -> UIColor {
        return customColor(red: UInt8(arc4random() % 255),
                           green: UInt8(arc4random() % 255),
                           blue: UInt8(arc4random() % 255))
    }
    
    public static func customColor(red: UInt8, green: UInt8, blue: UInt8) -> UIColor {
        return customColor(red: red, green: green, blue: blue, alpha: 255)
    }
    
    public static func customColor(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0,
                       green: CGFloat(green) / 255.0,
                       blue: CGFloat(blue) / 255.0,
                       alpha: CGFloat(alpha) / 255.0)
    }
    
    public static var customDarkGreen = UIColor.customColor(red: 0, green: 200, blue: 83)
    public static var customDarkGreenLight = UIColor.customDarkGreen.withAlphaComponent(0.1)
    public static var customBackground = UIColor.customColor(red: 55, green: 71, blue: 79)
    public static var customDarkBackground = UIColor.customColor(red: 38, green: 50, blue: 56)
    public static var customEmphasizeForeground = UIColor.customColor(red: 255, green: 235, blue: 59)
    public static var customAppColor = UIColor.customColor(red: 106, green: 27, blue: 154)
}
