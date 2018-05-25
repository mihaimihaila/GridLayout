//
//  UIViewAdditions.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public class func spacer(color: UIColor = .clear) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        
        return view
    }
    
    public func constraint(size: CGSize) {
        constraint(width: size.width, height: size.height)
    }
    
    public func constraint(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public func constraint(equalSize: Int) {
        constraint(size: CGSize(width: equalSize, height: equalSize))
    }
}
