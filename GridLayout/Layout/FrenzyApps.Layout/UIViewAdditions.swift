//
//  UIViewAdditions.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

public typealias SizeConstraints = (width: NSLayoutConstraint, height: NSLayoutConstraint)

extension UIView {
    public class func spacer(color: UIColor = .clear) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        
        return view
    }
    
    public func constraint(size: CGSize) -> SizeConstraints {
      return constraint(width: size.width, height: size.height)
    }
    
    public func constraint(width: CGFloat, height: CGFloat) -> SizeConstraints {
        let widthConstraint = widthAnchor.constraint(equalToConstant: width)
        let heightConstraint = heightAnchor.constraint(equalToConstant: height)
        
        widthConstraint.isActive = true
        heightConstraint.isActive = true
        
        return (width: widthConstraint, height: heightConstraint)
    }
    
    public func constraint(equalSize: Int) -> SizeConstraints {
        return constraint(size: CGSize(width: equalSize, height: equalSize))
    }
}
