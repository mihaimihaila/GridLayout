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
}
