//
//  GridLayoutTests3x3.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-20.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
import FrenzyApps_Layout

class GridLayoutTests3x3: GridLayoutTestsBase {
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
