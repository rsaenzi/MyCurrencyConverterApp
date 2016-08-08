//
//  Test_StringExtension.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_StringExtension: XCTestCase {
    
    func test_replace(){
        
        // Test data
        let source = "qwerty123qwerty"
        let after  = "123"
        let before = "AAAAA"
        
        // Lets check the replacement
        let final = source.replace(after, replacement: before)
        XCTAssertNotNil(final)
        XCTAssertTrue(final == "qwertyAAAAAqwerty")
    }
    
    func test_noSpaces(){
        
        // Test data
        let source = " q w e r t y "
        
        // The string must not have spaces
        let final = source.noSpaces()
        XCTAssertNotNil(final)
        XCTAssertTrue(final == "qwerty")
    }
    
    func test_contains(){
        
        // Test data
        let source       = "123qwerty123"
        let isIncluded    = "qwerty"
        let isNotIncluded = "PayU"
        
        // Case: String is contained
        var contains = source.contains(isIncluded)
        XCTAssertNotNil(contains)
        XCTAssertTrue(contains)
        
        // Case: String is not contained
        contains = source.contains(isNotIncluded)
        XCTAssertNotNil(contains)
        XCTAssertFalse(contains)
    }
    
}
