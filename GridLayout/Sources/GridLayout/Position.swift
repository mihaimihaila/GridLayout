//
//  Position.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import Foundation

public struct Position: Hashable {
    public var row: Int
    public var column: Int
    public var rowSpan: Int
    public var columnSpan: Int
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(column)
        hasher.combine(rowSpan)
        hasher.combine(columnSpan)
    }
    
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
