//
//  LayoutStyles.swift
//  FrenzyApps.Common
//
//  Created by Mihai Mihaila on 2018-02-07.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    static func gridLayoutView(items: [GridItem],
                               rows: [Row] = [.auto],
                               columns: [Column] = [.auto]) -> UIView {
        
        return gridLayoutView(items: items,
                              rowDefinitions: rows.map { $0.rowDefinition},
                              columnDefinitions: columns.map { $0.columnDefinition })
    }
}

public extension UIView {
    private static func gridLayoutView(items: [GridItem],
                                       rowDefinitions: [RowDefinition],
                                       columnDefinitions: [ColumnDefinition]) -> UIView {
        assert(rowDefinitions.count > 0)
        assert(columnDefinitions.count > 0)
        
        let rows = rowDefinitions.count
        let columns = columnDefinitions.count
        
        let containerView = UIView.spacer()
        var placeholders = [UIView]()
        
        for _ in 0..<max(rows, columns) {
            let placeholder = UIView.spacer()
            placeholders.append(placeholder)
            containerView.addSubview(placeholder)
        }
        
        var placeholdersConstraints = [NSLayoutConstraint]()
        placeholdersConstraints.append(contentsOf: addColumnPlaceholdersConstraints(columnDefinitions: columnDefinitions,
                                                                                    placeholders: placeholders))
        
        placeholdersConstraints.append(contentsOf: addRowPlaceholdersConstraints(rowDefinitions: rowDefinitions,
                                                                                 placeholders: placeholders))
        
        // define constraints between placeholders
        placeholders.enumerated().forEach { (placeholderIndex, placeholder) in
            let column = placeholderIndex % columns
            let row = placeholderIndex % rows
            let previousItemIndex = placeholderIndex - 1
            
            let anchorLeft = column == 0 ? containerView.leftAnchor : placeholders[previousItemIndex].rightAnchor
            placeholdersConstraints.append(placeholder.leftAnchor.constraint(equalTo: anchorLeft))
            
            let anchorTop = row == 0 ? containerView.topAnchor : placeholders[previousItemIndex].bottomAnchor
            placeholdersConstraints.append(placeholder.topAnchor.constraint(equalTo: anchorTop))
            
            if column == columns - 1 {
                placeholdersConstraints.append(placeholder.rightAnchor.constraint(equalTo: containerView.rightAnchor))
            }
            
            if row == rows - 1 {
                placeholdersConstraints.append(placeholder.bottomAnchor.constraint(equalTo: containerView.bottomAnchor))
            }
        }
        
        placeholdersConstraints.forEach { $0.isActive = true }
        
        let itemConstraints = addItemsConstraints(items: items,
                                                  columnDefinitions: columnDefinitions,
                                                  rowDefinitions: rowDefinitions,
                                                  placeholders: placeholders,
                                                  columns: columns,
                                                  rows: rows,
                                                  containerView: containerView)
        
        itemConstraints.forEach { $0.isActive = true }
        
        return containerView
    }
    
    // define the width ratio constraints for all * column placeholders
    private static func addColumnPlaceholdersConstraints(columnDefinitions: [ColumnDefinition],
                                                         placeholders: [UIView]) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        let ratio = columnDefinitions.compactMap { $0.isAuto ?  nil : $0.ratio }.reduce(0, +)
        if let referenceColumn = columnDefinitions.first(where: { !$0.isAuto }),
            let columnIndex = columnDefinitions.firstIndex(where: { $0 == referenceColumn }) {
            let referencePlaceholder = placeholders[columnIndex]
            let referenceRatio = ratio / referenceColumn.ratio
            placeholders.enumerated().forEach { (placeholderIndex, placeholder) in
                let column = placeholderIndex % columnDefinitions.count
                let columnDefinition = columnDefinitions[column]
                if !columnDefinition.isAuto && placeholder != referencePlaceholder {
                    let ratio = 1.0 / (ratio / columnDefinition.ratio / referenceRatio)
                    let constraint = placeholder.widthAnchor.constraint(equalTo: referencePlaceholder.widthAnchor,
                                                                        multiplier: ratio)
                    constraints.append(constraint)
                }
            }
        }
        
        return constraints
    }
    
    // define the height ratio constraints for all * row placeholders
    private static func addRowPlaceholdersConstraints(rowDefinitions: [RowDefinition],
                                                      placeholders: [UIView]) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        let totalHeightRatio = rowDefinitions.compactMap { $0.isAuto ? nil : $0.ratio }.reduce(0, +)
        if let referenceRow = rowDefinitions.first(where: { !$0.isAuto }),
            let rowIndex = rowDefinitions.firstIndex(where: { $0 == referenceRow }) {
            
            let referencePlaceholder = placeholders[rowIndex]
            let ratio = totalHeightRatio / referenceRow.ratio
            placeholders.enumerated().forEach { (placeholderIndex, placeholder) in
                let row = placeholderIndex % rowDefinitions.count
                let rowDefinition = rowDefinitions[row]
                if !rowDefinition.isAuto && placeholder != referencePlaceholder {
                    let ratio = 1.0 / (totalHeightRatio / rowDefinition.ratio / ratio)
                    let constraint = placeholder.heightAnchor.constraint(equalTo: referencePlaceholder.heightAnchor,
                                                                         multiplier: ratio)
                    constraints.append(constraint)
                }
            }
        }
        
        return constraints
    }
    
    // Auto rows and columns attempt to stretch their content, additional size constraints should be added appropriately
    // A view inside a a grid that is placed in another view tends to favor the outer grid size.
    // To avoid this behavior, stretch the inner most view
    // Use stretch on items with margins placed in auto rows or columns
    // Sets translatesAutoresizingMaskIntoConstraints to false on the returned UIView by default
    private static func addItemsConstraints(items: [GridItem],
                                            columnDefinitions: [ColumnDefinition],
                                            rowDefinitions: [RowDefinition],
                                            placeholders: [UIView],
                                            columns: Int,
                                            rows: Int,
                                            containerView: UIView) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
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
                    
                    spacer.constraint(equalTo: placeholderTop, for: { $0.topAnchor })
                    spacer.activateConstraint(equalTo: placeholderRight, for: { $0.rightAnchor })
                    spacer.constraint(equalTo: placeholderBottom, for: { $0.bottomAnchor })
                    spacer.activateConstraint(equalTo: placeholderLeft, for: { $0.leftAnchor })
                    
                    positionSpacers[position] = spacer
                }
            }
            
            if horizontal == .center {
                let reference = position.columnSpan == 1 ? placeholderLeft : positionSpacers[position]!
                constraints.append(item.view.centerXAnchor.constraint(equalTo: reference.centerXAnchor,
                                                                      constant: margin.left - margin.right))
            }
            
            if vertical == .center {
                let reference = position.rowSpan == 1 ? placeholderTop : positionSpacers[position]!
                constraints.append(item.view.centerYAnchor.constraint(equalTo: reference.centerYAnchor,
                                                                      constant: margin.top - margin.bottom))
            }
            
            if columnDefinition.isAuto {
                let reference = position.columnSpan == 1 ? placeholderLeft : positionSpacers[position]!
                constraints.append(item.view.widthAnchor.constraint(lessThanOrEqualTo: reference.widthAnchor,
                                                                    constant: -margin.right - margin.left))
            } else if horizontal == .stretch {
                constraints.append(item.view.widthAnchor.constraint(greaterThanOrEqualToConstant: 1))
            }
            
            if rowDefinition.isAuto {
                let reference = position.rowSpan == 1 ? placeholderTop : positionSpacers[position]!
                constraints.append(item.view.heightAnchor.constraint(lessThanOrEqualTo: reference.heightAnchor,
                                                                     constant: -margin.top - margin.bottom))
            } else if vertical == .stretch {
                constraints.append(item.view.heightAnchor.constraint(greaterThanOrEqualToConstant: 1))
            }
            
            if horizontal == .left || horizontal == .stretch {
                constraints.append(item.view.leftAnchor.constraint(equalTo: placeholderLeft.leftAnchor,
                                                                   constant: margin.left))
            } else {
                constraints.append(item.view.leftAnchor.constraint(greaterThanOrEqualTo: placeholderLeft.leftAnchor,
                                                                   constant: margin.left))
            }
            
            if horizontal == .right || horizontal == .stretch {
                constraints.append(item.view.rightAnchor.constraint(equalTo: placeholderRight.rightAnchor,
                                                                    constant: -margin.right))
            } else {
                constraints.append(item.view.rightAnchor.constraint(lessThanOrEqualTo: placeholderRight.rightAnchor,
                                                                    constant: -margin.right))
            }
            
            if vertical == .top || vertical == .stretch {
                constraints.append(item.view.topAnchor.constraint(equalTo: placeholderTop.topAnchor,
                                                                  constant: margin.top))
            } else {
                constraints.append(item.view.topAnchor.constraint(greaterThanOrEqualTo: placeholderTop.topAnchor,
                                                                  constant: margin.top))
            }
            
            if vertical == .bottom || vertical == .stretch {
                constraints.append(item.view.bottomAnchor.constraint(equalTo: placeholderBottom.bottomAnchor,
                                                                     constant: -margin.bottom))
            } else {
                constraints.append(item.view.bottomAnchor.constraint(lessThanOrEqualTo: placeholderBottom.bottomAnchor,
                                                                     constant: -margin.bottom))
            }
        }
        
        return constraints
    }
}
