//
//  Test_CurrencyConverter.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_CurrencyConverter: XCTestCase {
    
    func test_ValidMembers(){
        
        // All children must be valid
        XCTAssertNotNil(CurrencyConverter.app.brules)
        XCTAssertNotNil(CurrencyConverter.app.control)
        XCTAssertNotNil(CurrencyConverter.app.model)
        XCTAssertNotNil(CurrencyConverter.app.view)
    }
    
    func test_doStart(){
        
        // Call the doStart() method
        CurrencyConverter.app.doStart()
        
        // After that, the currencies array must have 31 entries
        XCTAssert(CurrencyConverter.app.model.currencies.count == 31)
    }
}
