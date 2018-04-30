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
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    public func constraint(size: Int) {
        constraint(size: CGSize(width: size, height: size))
    }
}
