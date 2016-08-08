//
//  Test_Validation.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_Validation: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.control.valid
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(Validation.getUniqueInstance())
        }
    }
    
    func test_isNotEmptyNumericString(){
        
        // First we test the lenght validation
        let emptyString = ""
        XCTAssertFalse(CurrencyConverter.app.control.valid.isNotEmptyNumericString(emptyString))
        
        // Test the letters validation
        let lettersString = "qwerty"
        XCTAssertFalse(CurrencyConverter.app.control.valid.isNotEmptyNumericString(lettersString))
        
        let mixedString = "1q2w3e4r5t6y7"
        XCTAssertFalse(CurrencyConverter.app.control.valid.isNotEmptyNumericString(mixedString))
        
        // Then we test the numeric string validation
        let numericString = "123456"
        XCTAssertTrue(CurrencyConverter.app.control.valid.isNotEmptyNumericString(numericString))
    }
    
}
