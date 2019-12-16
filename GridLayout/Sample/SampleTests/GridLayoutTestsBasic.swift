//
//  GridLayoutTestsBasic.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2018-04-24.
//  Copyright © 2018 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
@testable import GridLayout

extension UIView {
    public class func testSpacer() -> UIView {
        return .spacer(color: .customRandomColor())
    }
}

class GridLayoutTestsBasic: GridLayoutTestsBase {
    func testGridTwoItemsUsingConvenientBuilderMethod() {
        let itemView1 = UIView.testSpacer()
        let itemView2 = UIView.testSpacer()
        
        let view = UIView.gridLayoutView(items: [GridItem(itemView1),
                                                 GridItem(itemView2, row: 1,
                                                          horizontalAlignment: .stretch,
                                                          verticalAlignment: .stretch)],
                                         rows: [.auto, .fill],
                                         columns: [.auto])
        
        let _ = itemView1.constraint(width: 30, height: 30)
        
        let width: CGFloat = 100
        let height: CGFloat = 100
        addGridToScene(view, width: width, height: height)
        
        XCTAssertEqual(CGRect(x: 35, y: 0, width: 30, height: 30), itemView1.frame)
        XCTAssertEqual(CGRect(x: 0, y: 30, width: 100, height: 70), itemView2.frame)
        
        saveScreenshot()
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
                                         rows: [.fill, .auto],
                                         columns: [.fill])
        
        addGridToScene(view)
        
        XCTAssertEqual(CGRect(x: 45, y: 80, width: 10, height: 10), itemView.frame)
        saveScreenshot()
    }
}

// MARK: Grid Helpers
extension GridLayoutTestsBase {
    func addViewsToGrid(_ items: [GridItem],
                        rows: Int = 1,
                        columns: Int = 1,
                        width: CGFloat = 100, height: CGFloat = 100) {
        var rowDefinitions = [Row]()
        for _ in 0..<rows {
            rowDefinitions.append(.fill)
        }
        
        var columnDefinitions = [Column]()
        for _ in 0..<columns {
            columnDefinitions.append(.fill)
        }
        
        addViewsToGrid(items,
                       rows: rowDefinitions,
                       columns: columnDefinitions,
                       width: width, height: height)
    }
    
    func addViewsToGrid(_ items: [GridItem],
                        rows: [Row],
                        columns: [Column],
                        width: CGFloat = 100,
                        height: CGFloat = 100) {
        
        let view = UIView.gridLayoutView(items: items,
                                         rows: rows,
                                         columns: columns)
        
        addGridToScene(view, width: width, height: height)
    }
    
    func addGridToScene(_ view: UIView,
                        width: CGFloat = 100,
                        height: CGFloat = 100) {
        
        addViewToScene(view, width: width, height: height)
        
        UIApplication.shared.keyWindow?.rootViewController = viewController
        let waitExpectation = expectation(description: "waitExpectation")
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.001) {
            waitExpectation.fulfill()
        }
        
        wait(for: [waitExpectation], timeout: 1)
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
extension GridLayoutTestsBase {
    func addViewToScene(_ view: UIView, width: CGFloat = 100, height: CGFloat = 100) {
        view.backgroundColor = .magenta
        viewController.view.addSubview(view)
        
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor).isActive = true
    }
}
