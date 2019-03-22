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
                                             rows: [.auto],
                                             columns: [.auto])
        
        itemView.backgroundColor = .blue
        
        addViewsToGrid([GridItem(itemView)],
                       rows: [.fill],
                       columns: [.fill],
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
                                              rows: [.auto],
                                              columns: [.auto])
        
        innerGrid.backgroundColor = .green
        
        addViewsToGrid([GridItem(innerGrid)],
                       rows: [.fill],
                       columns: [.fill],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 40, width: 10, height: 10), innerGrid.frame)
        saveScreenshot()
    }
}
