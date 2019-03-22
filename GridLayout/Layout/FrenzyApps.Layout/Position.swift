//
//  Position.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import Foundation

public class Position: Equatable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(column)
        hasher.combine(rowSpan)
        hasher.combine(columnSpan)
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
