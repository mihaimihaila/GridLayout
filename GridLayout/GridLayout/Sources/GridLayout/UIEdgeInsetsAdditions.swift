//
//  UIEdgeInsetsAdditions.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

extension UIEdgeInsets: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int) {
        self.init(CGFloat(value))
    }
    
    public init(cgFloatLiteral value: CGFloat) {
        self.init(value)
    }
}

public extension UIEdgeInsets {
    init(_ constant: CGFloat) {
        self.init(top: constant, left: constant, bottom: constant, right: constant)
    }
}
