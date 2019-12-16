//
//  GridLayoutTests1x1.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-22.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
@testable import GridLayout

class GridLayoutTests1x1: GridLayoutTestsBase {
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
                       rows: [.fill],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 10, y: 20, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
    
    func testGrid1x1FillItemWithMargins() {
           let fillView = UIView.testSpacer()
           fillView.backgroundColor = .blue
           
          addViewsToGrid([GridItem(fillView,
                     row: 0,
                     column: 0,
                     horizontalAlignment: .stretch,
                     verticalAlignment: .stretch,
                     margin: UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 50))],
           rows: [.fill],
           columns: [.fill],
           width: 90,
           height: 90)
           
           XCTAssertEqual(CGRect(x: 10, y: 20, width: 30, height: 40), fillView.frame)
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
                       rows: [.fill],
                       columns: [.fill],
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
                       rows: [.fill],
                       columns: [.fill],
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
                       rows: [.fill],
                       columns: [.fill],
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
                       rows: [.fill],
                       columns: [.fill],
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
                       rows: [.fill],
                       columns: [.fill],
                       width: 90, height: 90)
        
        XCTAssertEqual(CGRect(x: 20, y: 25, width: 10, height: 10), fillView.frame)
        saveScreenshot()
    }
}
