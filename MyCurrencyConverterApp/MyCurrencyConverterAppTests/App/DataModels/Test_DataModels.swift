//
//  Test_DataModels.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_DataModels: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.model
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(DataModels.getUniqueInstance())
        }
    }
    
    func test_doStart(){
        
        // Call the doStart() method
        CurrencyConverter.app.model.doStart()
        
        // After that, the currencies array must have 31 entries
        XCTAssert(CurrencyConverter.app.model.currencies.count == 31)
    }
    
}
