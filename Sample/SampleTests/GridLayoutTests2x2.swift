//
//  GridLayoutTests2x2.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
@testable import GridLayout

class GridLayoutTests2x2: GridLayoutTestsBase {
    func testGrid2x2ItemPlacedAt0x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 0, rows: 2, columns: 2)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 50, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x2ItemPlacedAt0x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 1, rows: 2, columns: 2)
        
        XCTAssertEqual(CGRect(x: 50, y: 0, width: 50, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x2ItemPlacedAt1x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 0, rows: 2, columns: 2)
        
        XCTAssertEqual(CGRect(x: 0, y: 50, width: 50, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x2ItemPlacedAt1x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 1, rows: 2, columns: 2)
        
        XCTAssertEqual(CGRect(x: 50, y: 50, width: 50, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x2ItemPlacedAt1x0WithoutColumnSpanShouldNotSpanColumns() {
        let item1 = UIView.testSpacer()
        let item2 = UIView.testSpacer()
        
        let view = UIView.gridLayoutView(items: [ GridItem(item1,
                                                           position: Position(columnSpan: 2),
                                                           horizontalAlignment: .stretch,
                                                           verticalAlignment: .stretch),
                                                  GridItem(item2,
                                                           row: 1,
                                                           horizontalAlignment: .stretch,
                                                           verticalAlignment: .stretch)],
                                         rows: [.fill, .fill],
                                         columns: [.fill, .fill])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 45), item1.frame)
        XCTAssertEqual(CGRect(x: 0, y: 45, width: 45, height: 45), item2.frame)
        
        saveScreenshot()
    }
    
    func testGrid2x2CenterAlignedItemWithMarginsAcrossRowsAndColumns() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 position: Position(rowSpan: 2, columnSpan: 2),
                                 margin: UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 30))],
                       rows: [.fill, .fill],
                       columns: [.fill, .fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 20, y: 25, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
}
