//
//  Test_JsonParser.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_JsonParser: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.control.json
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(JsonParser.getUniqueInstance())
        }
    }
    
}
