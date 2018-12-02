//
//  LayoutStyles.swift
//  FrenzyApps.Common
//
//  Created by Mihai Mihaila on 2018-02-07.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

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

public class DimensionDefinition {
    let ratio: CGFloat
    let isAuto: Bool
    public init(isAuto: Bool = false, ratio: CGFloat = 1) {
        self.ratio = ratio
        self.isAuto = isAuto
    }
}

public enum Row {
    case auto
    case fill
    case fillHeight(ratio: CGFloat)
}

public extension Row {
    var rowDefinition: RowDefinition {
        switch self {
        case .auto:
            return RowDefinition(isAuto: true)
        case .fill:
           return RowDefinition(ratio: 1)
        case .fillHeight(let ratio):
        return RowDefinition(ratio: ratio)
        }
    }
}

public enum Column {
    case auto
    case fill
    case fillWidth(ratio: CGFloat)
}

public extension Column {
    var columnDefinition: ColumnDefinition {
        switch self {
        case .auto:
            return ColumnDefinition(isAuto: true)
        case .fill:
            return ColumnDefinition(ratio: 1)
        case .fillWidth(let ratio):
            return ColumnDefinition(ratio: ratio)
        }
    }
}

public class RowDefinition: DimensionDefinition {
}

public class ColumnDefinition: DimensionDefinition {
}
    
public class Position: Equatable, Hashable {
    public var hashValue: Int {
        return row * 1000 + column * 100 + rowSpan * 10 + columnSpan
    }
    
    public static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row &&
        lhs.column == rhs.column &&
        lhs.rowSpan == rhs.rowSpan &&
        lhs.columnSpan == rhs.columnSpan
    }
    
    public var row: Int
    public var column: Int
    public var rowSpan: Int
    public var columnSpan: Int
    
    public init(row: Int = 0, column: Int = 0, rowSpan: Int = 1, columnSpan: Int = 1) {
        self.row = row
        self.column = column
        self.rowSpan = rowSpan
        self.columnSpan = columnSpan
    }
}

extension Position: CustomStringConvertible {
    public var description: String {
        return "Position: row: \(row), column: \(column), rowSpan: \(rowSpan), columnSpan: \(columnSpan)"
    }
}

public class GridItem {
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
    public func stretched() -> GridItem {
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

public extension UIView {
    static func gridLayoutView(items: [GridItem],
                               rows: [Row] = [.auto],
                               columns: [Column] = [.auto]) -> UIView {
        
        return gridLayoutView(items: items,
                              rowDefinitions: rows.map { $0.rowDefinition},
                              columnDefinitions: columns.map { $0.columnDefinition })
    }
    
    // Auto rows and columns attempt to stretch their content, additional size constraints should be added appropriately
    // A view inside a a grid that is placed in another view tends to favor the outer grid size.
    // To avoid this behavior, stretch the inner most view
    // Use stretch on items with margins placed in auto rows or columns
    // Sets translatesAutoresizingMaskIntoConstraints to false on the returned UIView by default
    static func addItemsConstraints(items: [GridItem],
                                    columnDefinitions: [ColumnDefinition],
                                    rowDefinitions: [RowDefinition],
                                    placeholders: [UIView],
                                    columns: Int,
                                    rows: Int,
                                    containerView: UIView) {
        // additional spacers are needed for cells that span rows or cells
        var positionSpacers = [Position: UIView]()
        
        // define items constraints
        items.forEach { item in
            let position = item.position
            
            let columnDefinition = columnDefinitions[position.column]
            let rowDefinition = rowDefinitions[position.row]
            
            let placeholderLeft = placeholders[position.column]
            let placeholderTop = placeholders[position.row]
            let placeholderRight = placeholders[min(position.column + position.columnSpan - 1, columns - 1)]
            let placeholderBottom = placeholders[min(position.row + position.rowSpan - 1, rows - 1)]
            
            containerView.addSubview(item.view)
            
            if rowDefinition.isAuto {
                // if there is no item on this row and rowSpan, stretch the item vertically
                if (items.first { foundItem in
                    foundItem.position.row == position.row &&
                        foundItem.position.rowSpan == position.rowSpan &&
                        foundItem !== item
                }) == nil {
                    item.verticalAlignment = .stretch
                }
            }
            
            if columnDefinition.isAuto {
                // if there is no item on this column and columnSpan, stretch the item horizontally
                if (items.first { foundItem in
                    foundItem.position.column == position.column &&
                        foundItem.position.columnSpan == position.columnSpan &&
                        foundItem !== item
                }) == nil {
                    item.horizontalAlignment = .stretch
                }
            }
            
            let margin = item.margin
            let horizontal = item.horizontalAlignment
            let vertical = item.verticalAlignment
            
            // ensure all items that span rows or columns have a position spacer
            if position.rowSpan != 1 || position.columnSpan != 1 {
                if positionSpacers[position] == nil {
                    // if there is not cell spacer for this particular combination of position, create a new one
                    let spacer = UIView.spacer()
                    spacer.isUserInteractionEnabled = false
                    containerView.addSubview(spacer)
                    
                    spacer.topAnchor.constraint(equalTo: placeholderTop.topAnchor).isActive = true
                    spacer.rightAnchor.constraint(equalTo: placeholderRight.rightAnchor).isActive = true
                    spacer.bottomAnchor.constraint(equalTo: placeholderBottom.bottomAnchor).isActive = true
                    spacer.leftAnchor.constraint(equalTo: placeholderLeft.leftAnchor).isActive = true
                    
                    positionSpacers[position] = spacer
                }
            }
            
            if horizontal == .center {
                let reference = position.columnSpan == 1 ? placeholderLeft : positionSpacers[position]!
                item.view.centerXAnchor.constraint(equalTo: reference.centerXAnchor,
                                                   constant: margin.left - margin.right).isActive = true
            }
            
            if vertical == .center {
                let reference = position.rowSpan == 1 ? placeholderTop : positionSpacers[position]!
                item.view.centerYAnchor.constraint(equalTo: reference.centerYAnchor,
                                                   constant: margin.top - margin.bottom).isActive = true
            }
            
            if columnDefinition.isAuto {
                let reference = position.columnSpan == 1 ? placeholderLeft : positionSpacers[position]!
                item.view.widthAnchor.constraint(lessThanOrEqualTo: reference.widthAnchor,
                                                 constant: -margin.right - margin.left).isActive = true
            } else if horizontal == .stretch {
                item.view.widthAnchor.constraint(greaterThanOrEqualToConstant: 1).isActive = true
            }
            
            if rowDefinition.isAuto {
                let reference = position.rowSpan == 1 ? placeholderTop : positionSpacers[position]!
                item.view.heightAnchor.constraint(lessThanOrEqualTo: reference.heightAnchor,
                                                  constant: -margin.top - margin.bottom).isActive = true
            } else if vertical == .stretch {
                item.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 1).isActive = true
            }
            
            if horizontal == .left || horizontal == .stretch {
                item.view.leftAnchor.constraint(equalTo: placeholderLeft.leftAnchor,
                                                constant: margin.left).isActive = true
            } else {
                item.view.leftAnchor.constraint(greaterThanOrEqualTo: placeholderLeft.leftAnchor,
                                                constant: margin.left).isActive = true
            }
            
            if horizontal == .right || horizontal == .stretch {
                item.view.rightAnchor.constraint(equalTo: placeholderRight.rightAnchor,
                                                 constant: -margin.right).isActive = true
            } else {
                item.view.rightAnchor.constraint(lessThanOrEqualTo: placeholderRight.rightAnchor,
                                                 constant: -margin.right).isActive = true
            }
            
            if vertical == .top || vertical == .stretch {
                item.view.topAnchor.constraint(equalTo: placeholderTop.topAnchor, constant: margin.top).isActive = true
            } else {
                item.view.topAnchor.constraint(greaterThanOrEqualTo: placeholderTop.topAnchor,
                                               constant: margin.top).isActive = true
            }
            
            if vertical == .bottom || vertical == .stretch {
                item.view.bottomAnchor.constraint(equalTo: placeholderBottom.bottomAnchor,
                                                  constant: -margin.bottom).isActive = true
            } else {
                item.view.bottomAnchor.constraint(lessThanOrEqualTo: placeholderBottom.bottomAnchor,
                                                  constant: -margin.bottom).isActive = true
            }
        }
    }
    
    // define the width ratio constraints for all * column placeholders
    static func addColumnsPlaceholdersConstraints(columnDefinitions: [ColumnDefinition],
                                                  placeholders: [UIView],
                                                  columns: Int) {
        
        let totalWidthRatio = columnDefinitions.compactMap { $0.isAuto ?  nil : $0.ratio }.reduce(0, +)
        if let widthReferenceColumn = columnDefinitions.first(where: { !$0.isAuto }),
            let columnIndex = columnDefinitions.index(where: { $0 === widthReferenceColumn }) {
            let widthReferencePlaceholder = placeholders[columnIndex]
            let widthReferenceRatio = totalWidthRatio / widthReferenceColumn.ratio
            placeholders.enumerated().forEach { (placeholderIndex, placeholder) in
                let column = placeholderIndex % columns
                let columnDefinition = columnDefinitions[column]
                if !columnDefinition.isAuto && placeholder != widthReferencePlaceholder {
                    let ratio = 1.0 / (totalWidthRatio / columnDefinition.ratio / widthReferenceRatio)
                    placeholder.widthAnchor.constraint(equalTo: widthReferencePlaceholder.widthAnchor,
                                                       multiplier: ratio).isActive = true
                }
            }
        }
    }
    
    // define the height ratio constraints for all * row placeholders
    static func addRowsPlaceholdersConstraints(rowDefinitions: [RowDefinition], placeholders: [UIView], rows: Int) {
        let totalHeightRatio = rowDefinitions.compactMap { $0.isAuto ? nil : $0.ratio }.reduce(0, +)
        if let heightReferenceRow = rowDefinitions.first(where: { !$0.isAuto }),
            let rowIndex = rowDefinitions.index(where: { $0 === heightReferenceRow }) {
            let heightReferencePlaceholder = placeholders[rowIndex]
            let heightReferenceRatio = totalHeightRatio / heightReferenceRow.ratio
            placeholders.enumerated().forEach { (placeholderIndex, placeholder) in
                let row = placeholderIndex % rows
                let rowDefinition = rowDefinitions[row]
                if !rowDefinition.isAuto && placeholder != heightReferencePlaceholder {
                    let ratio = 1.0 / (totalHeightRatio / rowDefinition.ratio / heightReferenceRatio)
                    placeholder.heightAnchor.constraint(equalTo: heightReferencePlaceholder.heightAnchor,
                                                        multiplier: ratio).isActive = true
                }
            }
        }
    }
    
    static func gridLayoutView(items: [GridItem],
                               rowDefinitions: [RowDefinition] = [RowDefinition(isAuto: true)],
                               columnDefinitions: [ColumnDefinition] = [ColumnDefinition(isAuto: true)]) -> UIView {
        assert(rowDefinitions.count > 0)
        assert(columnDefinitions.count > 0)
        
        let rows = rowDefinitions.count
        let columns = columnDefinitions.count
        
        let containerView = UIView.spacer()
        var placeholders = [UIView]()
        
        for _ in 0..<max(rows, columns) {
            let placeholder = UIView.spacer()
            // Testing
            // placeholder.backgroundColor = UIColor.customRandomColor()
            placeholders.append(placeholder)
            containerView.addSubview(placeholder)
        }
        
        addColumnsPlaceholdersConstraints(columnDefinitions: columnDefinitions,
                               placeholders: placeholders,
                               columns: columns)
        
        addRowsPlaceholdersConstraints(rowDefinitions: rowDefinitions,
                            placeholders: placeholders,
                            rows: rows)
        
        // define constraints between placeholders
        placeholders.enumerated().forEach { (placeholderIndex, spacer) in
            let column = placeholderIndex % columns
            let row = placeholderIndex % rows
            let previousItemIndex = placeholderIndex - 1
            
            let anchorLeft = column == 0 ? containerView.leftAnchor : placeholders[previousItemIndex].rightAnchor
            spacer.leftAnchor.constraint(equalTo: anchorLeft).isActive = true
            
            let anchorTop = row == 0 ? containerView.topAnchor : placeholders[previousItemIndex].bottomAnchor
            spacer.topAnchor.constraint(equalTo: anchorTop).isActive = true
            
            if column == columns - 1 {
                spacer.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
            }
            
            if row == rows - 1 {
                spacer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            }
        }
        
        addItemsConstraints(items: items,
                            columnDefinitions: columnDefinitions,
                            rowDefinitions: rowDefinitions,
                            placeholders: placeholders,
                            columns: columns,
                            rows: rows,
                            containerView: containerView)
        
        return containerView
    }
}
