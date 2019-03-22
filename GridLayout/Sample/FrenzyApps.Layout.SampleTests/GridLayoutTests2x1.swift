//
//  GridLayoutTests2x1.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
@testable import FrenzyApps_Layout

class GridLayoutTests2x1: GridLayoutTestsBase {
    func testGrid2x1AutoFirstRowUsingMargins() {
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
                                 column: 0,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 20, left: 0, bottom: 15, right: 0))],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 45), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoFirstRowUsingMarginsWithoutHorizontalStretch() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        autoItem1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        autoItem1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 1,
                                 column: 0,
                                 verticalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 20, left: 0, bottom: 15, right: 0))],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 25), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoFirstRowPosition() {
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
                                 column: 0,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 20, left: 0, bottom: 30, right: 0))],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 50, width: 90, height: 10), autoItem1.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoItemsDefineCorrectHeight() {
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
                                 row: 1)],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 70), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoItemCenterVerticalAlignmentInLargeAutoRow() {
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
                                 position: Position(columnSpan: 2),
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem2,
                                 row: 1),
                        GridItem(autoItem1,
                                 row: 1,
                                 verticalAlignment: .center),],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 75, width: 10, height: 10), autoItem1.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoItemTopVerticalAlignmentInLargeAutoRow() {
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
                                 position: Position(columnSpan: 2),
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem2,
                                 row: 1),
                        GridItem(autoItem1,
                                 row: 1,
                                 verticalAlignment: .top),],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 70, width: 10, height: 10), autoItem1.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoItemBottomCenterInLargeAutoRow() {
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
                                 position: Position(columnSpan: 2),
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem2,
                                 row: 1),
                        GridItem(autoItem1,
                                 row: 1,
                                 verticalAlignment: .bottom),],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 80, width: 10, height: 10), autoItem1.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoItemBottomRightInLargeAutoRow() {
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
                                 position: Position(columnSpan: 2),
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem2,
                                 row: 1),
                        GridItem(autoItem1,
                                 row: 1,
                                 horizontalAlignment: .right,
                                 verticalAlignment: .bottom)],
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 80, y: 80, width: 10, height: 10), autoItem1.frame)
        saveScreenshot()
    }
    
    func testGrid2x1AutoFirstColumnUsingMargins() {
        let fillView = UIView.testSpacer()
        let autoItem1 = UIView.testSpacer()
        
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 row: 0,
                                 column: 1,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 20))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition(),
                                           ColumnDefinition(isAuto: true)],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 45, height: 90), fillView.frame)
        saveScreenshot()
    }
}
