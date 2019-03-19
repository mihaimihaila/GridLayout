//
//  GridLayoutTestsInsideGrid.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
import FrenzyApps_Layout

class GridLayoutTestsInsideGrid: GridLayoutTestsBase {
    func testGrid1x1CenterInsideAnotherGrid() {
        let itemView = UIView.gridLayoutView(items: [],
                                             rowDefinitions: [RowDefinition()],
                                             columnDefinitions: [ColumnDefinition()])
        
        itemView.backgroundColor = .blue
        
        addViewsToGrid([GridItem(itemView)],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 45, y: 45, width: 0, height: 0), itemView.frame)
        saveScreenshot()
    }
    
    func testViewInsideGridInsideAnotherGrid() {
        let itemView = UIView.testSpacer()
        itemView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        itemView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        let innerGrid = UIView.gridLayoutView(items: [GridItem(itemView,
                                                               horizontalAlignment: .stretch,
                                                               verticalAlignment: .stretch)],
                                              rowDefinitions: [RowDefinition()],
                                              columnDefinitions: [ColumnDefinition()])
        
        innerGrid.backgroundColor = .green
        
        addViewsToGrid([GridItem(innerGrid)],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 40, width: 10, height: 10), innerGrid.frame)
        saveScreenshot()
    }
}
