//
//  GridLayoutTests.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import XCTest

import Foundation
import FrenzyApps_Layout

import XCTest
import KIF

extension UIView {
    public class func testSpacer() -> UIView {
        let view = UIView.spacer()
        view.backgroundColor = UIColor.customRandomColor()
        
        return view
    }
}

class GridLayoutTests: KIFTestCase {
    
    let viewController = UIViewController()
    
    var tempViewController: UIViewController?
    
    override func setUp() {
        super.setUp()
        
        viewController.view.backgroundColor = .white
        
        tempViewController = UIApplication.shared.keyWindow?.rootViewController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    override func tearDown() {
        super.tearDown()
        
        UIApplication.shared.keyWindow?.rootViewController = tempViewController
    }
    
    func drawImage(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return viewImage
    }
    
    func saveScreenshot(title: String = #function) {
        guard let view = viewController.view.subviews.first,
            let image = drawImage(view: view) else { return }
        
        var curatedTitle = title.replacingOccurrences(of: "(", with: "")
        curatedTitle = curatedTitle.replacingOccurrences(of: ")", with: "")
        curatedTitle = "\(curatedTitle).png"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        guard let filePath = NSURL(fileURLWithPath: paths[0]).appendingPathComponent(curatedTitle) else { return }
        try? UIImagePNGRepresentation(image)?.write(to: filePath)
    }
    
    func testGrid1x1ItemPlaced0x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 0, rows: 1, columns: 1)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 100, height: 100), itemView.frame)
        
        saveScreenshot()
    }
    
    func testGrid1x2ItemPlaced0x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 0, rows: 1, columns: 2)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 50, height: 100), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid1x2ItemPlaced0x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 1, rows: 1, columns: 2)
        
        XCTAssertEqual(CGRect(x: 50, y: 0, width: 50, height: 100), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1ItemPlaced0x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 0, rows: 2, columns: 1)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 100, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1ItemPlaced1x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 0, rows: 2, columns: 1)
        
        XCTAssertEqual(CGRect(x: 0, y: 50, width: 100, height: 50), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid2x1ItemPlaced1x0WithMargins() {
        let itemView = UIView.testSpacer()
        itemView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        itemView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        let view = UIView.gridLayoutView(items: [GridItem(itemView, row: 1, margin: UIEdgeInsets(10))],
                                         rowDefinitions: [RowDefinition(),
                                                          RowDefinition(isAuto: true)],
                                         columnDefinitions: [ColumnDefinition()])
        
        addGridToScene(view)
        
        XCTAssertEqual(CGRect(x: 45, y: 80, width: 10, height: 10), itemView.frame)
        saveScreenshot()
    }
}

// MARK: 2x2
extension GridLayoutTests {
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
                                         rowDefinitions: [RowDefinition(),
                                                          RowDefinition()],
                                         columnDefinitions: [ColumnDefinition(),
                                                             ColumnDefinition()])
        
        addGridToScene(view, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 90, height: 45), item1.frame)
        XCTAssertEqual(CGRect(x: 0, y: 45, width: 45, height: 45), item2.frame)
        
        saveScreenshot()
    }
}

// MARK: 3x1 with several items in the same cells
extension GridLayoutTests {
    func testGrid3x1WithItemSpanningAutoRows() {
        let item1 = UIView.testSpacer()
        let item2 = UIView.testSpacer()
        let item3 = UIView.testSpacer()
        
        item1.constraint(equalSize: 10)
        item2.constraint(equalSize: 20)
        
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

// MARK: 3x3
extension GridLayoutTests {
    func testGrid3x3ItemPlacedAt0x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 0, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 0, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt0x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 1, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 30, y: 0, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt0x2() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 0, column: 2, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 60, y: 0, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt1x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 0, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 00, y: 30, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt1x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 1, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 30, y: 30, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt1x2() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 1, column: 2, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 60, y: 30, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt2x0() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 2, column: 0, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 0, y: 60, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt2x1() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 2, column: 1, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 30, y: 60, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
    
    func testGrid3x3ItemPlacedAt2x2() {
        let itemView = UIView.testSpacer()
        
        addSingleViewToGrid(itemView, row: 2, column: 2, rows: 3, columns: 3, width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 60, y: 60, width: 30, height: 30), itemView.frame)
        saveScreenshot()
    }
}

extension GridLayoutTests {
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

// MARK: Auto on rows
extension GridLayoutTests {
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

// MARK: Grid Helpers
extension GridLayoutTests {
    func addViewsToGrid(_ items: [GridItem],
                        rows: Int = 1, columns: Int = 1,
                        width: CGFloat = 100, height: CGFloat = 100) {
        var rowDefinitions = [RowDefinition]()
        for _ in 0..<rows {
            rowDefinitions.append(RowDefinition())
        }
        
        var columnDefinitions = [ColumnDefinition]()
        for _ in 0..<columns {
            columnDefinitions.append(ColumnDefinition())
        }
        
        addViewsToGrid(items,
                       rowDefinitions: rowDefinitions, columnDefinitions: columnDefinitions,
                       width: width, height: height)
    }
    
    func addViewsToGrid(_ items: [GridItem],
                        rowDefinitions: [RowDefinition],
                        columnDefinitions: [ColumnDefinition],
                        width: CGFloat = 100,
                        height: CGFloat = 100) {
        
        let view = UIView.gridLayoutView(items: items,
                                         rowDefinitions: rowDefinitions,
                                         columnDefinitions: columnDefinitions)
        
        addGridToScene(view, width: width, height: height)
    }
    
    func addGridToScene(_ view: UIView,
                        width: CGFloat = 100,
                        height: CGFloat = 100) {
        
        addViewToScene(view, width: width, height: height)
        
        UIApplication.shared.keyWindow?.rootViewController = viewController
        tester().waitForAnimationsToFinish()
    }
    
    func addSingleViewToGrid(_ itemView: UIView,
                             row: Int = 0,
                             column: Int = 0,
                             rows: Int = 1,
                             columns: Int = 1,
                             width: CGFloat = 100,
                             height: CGFloat = 100,
                             margin: UIEdgeInsets = .zero) {
        
        addViewsToGrid([GridItem(itemView,
                                 row: row,
                                 column: column,
                                 horizontalAlignment: .stretch,
                                 verticalAlignment: .stretch,
                                 margin: margin)],
                       rows: rows,
                       columns: columns,
                       width: width,
                       height: height)
    }
}

// MARK: Test Helpers
extension GridLayoutTests {
    func addViewToScene(_ view: UIView, width: CGFloat = 100, height: CGFloat = 100) {
        view.backgroundColor = .magenta
        viewController.view.addSubview(view)
        
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor).isActive = true
    }
}
