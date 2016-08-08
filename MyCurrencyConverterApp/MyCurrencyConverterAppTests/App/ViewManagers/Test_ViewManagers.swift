//
//  Test_ViewManagers.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_ViewManagers: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.view
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(ViewManagers.getUniqueInstance())
        }
    }
    
    func test_loadImage(){
        
        // Must return an empty image if it is not found by name
        let emptyImage = CurrencyConverter.app.view.loadImage("")
        XCTAssert(emptyImage.size == CGSize.zero)
        
        let validImage = CurrencyConverter.app.view.loadImage("Flag\(eCurrencyCode.Euro.rawValue)")
        XCTAssertFalse(validImage.size == CGSize.zero)
    }
    
}
