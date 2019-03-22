//
//  DimensionDefinition.swift
//  FrenzyApps.Layout
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import Foundation

public class DimensionDefinition {
    let ratio: CGFloat
    let isAuto: Bool
    public init(isAuto: Bool = false, ratio: CGFloat = 1) {
        self.ratio = ratio
        self.isAuto = isAuto
    }
}

public class RowDefinition: DimensionDefinition {
}

public class ColumnDefinition: DimensionDefinition {
}

public enum Row {
    case auto
    case fill
    case fillHeight(ratio: CGFloat)
}

public enum Column {
    case auto
    case fill
    case fillWidth(ratio: CGFloat)
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
