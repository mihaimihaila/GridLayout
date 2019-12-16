//
//  GridLayoutTestsBase.swift
//  FrenzyApps.Layout.SampleTests
//
//  Created by Mihai Mihaila on 2019-03-19.
//  Copyright © 2019 Mihai Mihaila. All rights reserved.
//

import XCTest
import Foundation
import GridLayout

class GridLayoutTestsBase: XCTestCase {
    
    let viewController = UIViewController()
    var tempViewController: UIViewController?
    let captureScreenshots = false
    
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
        guard captureScreenshots else { return }
        guard let view = viewController.view.subviews.first,
            let image = drawImage(view: view) else { return }
        
        var curatedTitle = title.replacingOccurrences(of: "(", with: "")
        curatedTitle = curatedTitle.replacingOccurrences(of: ")", with: "")
        curatedTitle = "\(curatedTitle).png"
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        guard let filePath = NSURL(fileURLWithPath: paths[0]).appendingPathComponent(curatedTitle) else { return }
        try? image.pngData()?.write(to: filePath)
        print("Screenshot saved to \(filePath)")
    }
}
