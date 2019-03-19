//
//  GridLayoutTestsAutoRows.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
import FrenzyApps_Layout

class GridLayoutTestsAutoRows: GridLayoutTestsBase {
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
                       rowDefinitions: [RowDefinition(), RowDefinition(isAuto: true), RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 00, width: 90, height: 60), fillView.frame)
        saveScreenshot()
    }
    
    // two auto rows
    // two auto rows, * first, * middle, * last
    func testGrid1x1TopLeftAlignedItemWithMargins() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .left,
                                 verticalAlignment: .top,
                                 margin: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 0))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 10, y: 20, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1BottomLeftAlignedItemWithMargins() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .left,
                                 verticalAlignment: .bottom,
                                 margin: UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 0))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 10, y: 70, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1TopRightAlignedItemWithMargins() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .right,
                                 verticalAlignment: .top,
                                 margin: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 10))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 70, y: 20, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1BottomRightAlignedItemWithMargins() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 row: 0,
                                 column: 0,
                                 horizontalAlignment: .right,
                                 verticalAlignment: .bottom,
                                 margin: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 10))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 70, y: 60, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1CenterAlignedItem() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView)],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 40, y: 40, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1CenterAlignedItemWithMargins() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 margin: UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 30))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 20, y: 25, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1CenterAlignedItemWithMarginsAcrossRowsAndColumns() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        
        fillView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        fillView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 position: Position(rowSpan: 2, columnSpan: 2),
                                 margin: UIEdgeInsets(top: 5, left: 10, bottom: 20, right: 30))],
                       rowDefinitions: [RowDefinition(), RowDefinition()],
                       columnDefinitions: [ColumnDefinition(), ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 20, y: 25, width: 10, height: 10), fillView.frame)
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 25), fillView.frame)
        saveScreenshot()
    }
    
    func aTestGrid3x1AutoSpanItems() {
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
                       rowDefinitions: [RowDefinition(),
                                        RowDefinition(isAuto: true),
                                        RowDefinition(isAuto: true)],
                       columnDefinitions: [ColumnDefinition()],
                       width: 90, height: 90)
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 60, height: 90), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x3AutoFirstColumnWithTwoItemsInAutoColumns() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
        let autoItem2 = UIView.testSpacer()
        autoItem2.backgroundColor = .red
        
        autoItem1.widthAnchor.constraint(equalToConstant: 10).isActive = true
        autoItem2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addViewsToGrid([GridItem(fillView,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch),
                        GridItem(autoItem1,
                                 column: 1),
                        GridItem(autoItem2,
                                 column: 2)],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition(),
                                           ColumnDefinition(isAuto: true),
                                           ColumnDefinition(isAuto: true)],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 60, height: 90), fillView.frame)
        saveScreenshot()
    }
    
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
    
    func testGrid1x2AutoFirstRowUsingMarginsWithoutVerticalStretch() {
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
                                 row: 0,
                                 column: 1,
                                 horizontalAlignment: .stretch,
                                 margin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 15))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition(),
                                           ColumnDefinition(isAuto: true)],
                       width: 90,
                       height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 25, height: 90), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x2AutoFirstColumnPosition() {
        let fillView = UIView.testSpacer()
        fillView.backgroundColor = .blue
        let autoItem1 = UIView.testSpacer()
        autoItem1.backgroundColor = .red
        
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
                                 margin: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 30))],
                       rowDefinitions: [RowDefinition()],
                       columnDefinitions: [ColumnDefinition(),
                                           ColumnDefinition(isAuto: true)],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 50, y: 0, width: 10, height: 90), autoItem1.frame)
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
