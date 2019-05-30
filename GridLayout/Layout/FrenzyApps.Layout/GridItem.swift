//
//  GridItem.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import Foundation

public class GridItem {
    public enum HorizontalAlignment {
        case left
        case center
        case right
        case stretch
    }
    
    public enum VerticalAlignment {
        case top
        case center
        case bottom
        case stretch
    }
    
    public let view: UIView
    public var position: Position
    var horizontalAlignment: HorizontalAlignment
    var verticalAlignment: VerticalAlignment
    let margin: UIEdgeInsets
    
    public init(_ view: UIView,
                position: Position = Position(),
                horizontalAlignment: HorizontalAlignment = .center,
                verticalAlignment: VerticalAlignment = .center,
                margin: UIEdgeInsets = .zero) {
        self.view = view
        self.position = position
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.margin = margin
    }
    
    public convenience init(_ view: UIView,
                            row: Int = 0,
                            column: Int = 0,
                            horizontalAlignment: HorizontalAlignment = .center,
                            verticalAlignment: VerticalAlignment = .center,
                            margin: UIEdgeInsets = .zero) {
        self.init(view,
                  position: Position(row: row, column: column),
                  horizontalAlignment: horizontalAlignment,
                  verticalAlignment: verticalAlignment,
                  margin: margin)
    }
}

public extension GridItem {
    func stretched() -> GridItem {
        horizontalAlignment = .stretch
        verticalAlignment = .stretch
        
        return self
    }
}

extension GridItem: CustomStringConvertible {
    public var description: String {
        return "GridItem:\n\(position)\nhorizontal: \(horizontalAlignment)\nvertical: \(verticalAlignment)"
    }
}
