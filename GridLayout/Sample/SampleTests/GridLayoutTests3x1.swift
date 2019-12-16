//
//  GridLayoutTests3x1.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
@testable import GridLayout

class GridLayoutTests3x1: GridLayoutTestsBase {
    func testGrid3x1AutoFirstRow() {
        let fillView = UIView.testSpacer()
        
        let autoItem1 = UIView.testSpacer()
        let autoItem2 = UIView.testSpacer()
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0, column: 0,
                                 horizontalAlignment: .stretch, verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1, column: 0,
                                 horizontalAlignment: .stretch, verticalAlignment: .stretch),
                        GridItem(autoItem2,
                                 row: 2, column: 0,
                                 horizontalAlignment: .stretch, verticalAlignment: .stretch)],
                       rows: [.fill, .auto, .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 00, width: 90, height: 60), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoFirstRowWithLastAutoRowEmpty() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1,
                                 column: 0)],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 80), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoFirstRowWithTwoItemsInAutoRows() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .green
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1),
                        GridItem(autoItem2,
                                 row: 2)],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 60), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoFirstRowWithTwoItemsInAutoRowsWithBottomMargin() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .green
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1,
                                 verticalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)),
                        GridItem(autoItem2,
                                 row: 2,
                                 verticalAlignment: .stretch)],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 30), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoFirstRowWithTwoItemsInAutoRowsWithTopMargin() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .red
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1,
                                 margin: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)),
                        GridItem(autoItem2,
                                 row: 2)],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 30), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoFirstRowWithTwoItemsInAutoRowsWithTopBottomMargin() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .red
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1,
                                 margin: UIEdgeInsets(top: 30, left: 0, bottom: 5, right: 0)),
                        GridItem(autoItem2,
                                 row: 2)],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 25), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid3x1AutoSpanItems() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        let placeholder = UIView.testSpacer()
        placeholder.backgroundColor = .gray
        
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .green
        
        autoItem1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        autoItem2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(placeholder,
                                 position: Position(row: 1, rowSpan: 2),
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1),
                        GridItem(autoItem2,
                                 row: 2),
            ],
                       rows: [.fill,
                              .auto,
                              .auto],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 60), fillView.frame)
        saveScreenshot()
    }
    
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
                                         rows: [.fill,
                                                .auto,
                                                .auto
            ],
                                         columns: [.fill])
        
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
                                         rows: [.fill,
                                                .fill,
                                                .fill
            ],
                                         columns: [.fill])
        
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
                                         rows: [.fill],
                                         columns: [.fill,
                                                   .fill,
                                                   .fill])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 60, height: 90), item1.frame)
        XCTAssertEqual(CGRect(x: 30, y: 0, width: 60, height: 90), item2.frame)
        
        saveScreenshot()
    }
}
