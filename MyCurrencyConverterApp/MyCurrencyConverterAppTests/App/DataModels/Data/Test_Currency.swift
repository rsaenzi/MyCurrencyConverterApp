//
//  Test_Currency.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_Currency: XCTestCase {
    
    func test_Init(){
        
        // Validates that initializer behaves the way it's supposed to...
        let currency = Currency(code: eCurrencyCode.Euro)
        
        // Musta have the same code
        XCTAssert(currency.code == eCurrencyCode.Euro)
        
        // Must have a default value
        XCTAssert(currency.rate == 1.0)
        
        // Must have a name
        XCTAssert(currency.name.characters.count > 0)
        
        // The images must not be empty
        XCTAssertFalse(currency.flag.size == CGSize.zero)
        XCTAssertFalse(currency.landscape.size == CGSize.zero)
    }
}
