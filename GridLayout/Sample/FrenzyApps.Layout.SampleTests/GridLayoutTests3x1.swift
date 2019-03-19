//
//  GridLayoutTests3x1.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
import FrenzyApps_Layout

class GridLayoutTests3x1: GridLayoutTestsBase {
    func testGrid3x1WithItemSpanningAutoRows() {
        let item1 = UIView.testSpacer()
        let item2 = UIView.testSpacer()
        let item3 = UIView.testSpacer()
        
        _ = item1.constraint(equalSize: 10)
        _ = item2.constraint(equalSize: 20)
        
        let view = UIView.gridLayoutView(items: [
            GridItem(item3,
                     position: Position(row: 1, rowSpan: 2),
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch),
            GridItem(item1, row: 1),
            GridItem(item2, row: 2)
            ],
                                         rowDefinitions: [RowDefinition(),
                                                          RowDefinition(isAuto: true),
                                                          RowDefinition(isAuto: true)
            ],
                                         columnDefinitions: [ColumnDefinition()])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 60, width: 90, height: 30), item3.frame)
        saveScreenshot()
    }
    
    func testGrid3x1WithSeveralItemsSpanningTheSameRow() {
        let item1 = UIView.testSpacer()
        let item2 = UIView.testSpacer()
        
        let view = UIView.gridLayoutView(items: [
            GridItem(item1,
                     position: Position(rowSpan: 2),
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch),
            GridItem(item2,
                     position: Position(row: 1, rowSpan: 2),
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch),
            ],
                                         rowDefinitions: [RowDefinition(),
                                                          RowDefinition(),
                                                          RowDefinition()
            ],
                                         columnDefinitions: [ColumnDefinition()])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 60), item1.frame)
        XCTAssertEqual(CGRect(x: 0, y: 30, width: 90, height: 60), item2.frame)
        
        saveScreenshot()
    }
    
    func testGrid3x1WithSeveralItemsSpanningTheSameColumn() {
        let item1 = UIView.testSpacer()
        let item2 = UIView.testSpacer()
        
        let view = UIView.gridLayoutView(items: [
            GridItem(item1,
                     position: Position(columnSpan: 2),
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch),
            GridItem(item2,
                     position: Position(column: 1, columnSpan: 2),
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch),
            ],
                                         rowDefinitions: [RowDefinition()],
                                         columnDefinitions: [ColumnDefinition(),
                                                             ColumnDefinition(),
                                                             ColumnDefinition()])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 60, height: 90), item1.frame)
        XCTAssertEqual(CGRect(x: 30, y: 0, width: 60, height: 90), item2.frame)
        
        saveScreenshot()
    }
}
