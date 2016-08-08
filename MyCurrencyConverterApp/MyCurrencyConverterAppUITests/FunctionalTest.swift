//
//  FunctionalTest.swift
//  MyCurrencyConverterAppUITests
//
//  Created by Rigoberto Sáenz Imbacuán on 8/5/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class FunctionalTest: XCTestCase {
    
    // UI Elements
    var app: XCUIApplication!
    var buttonConvert: XCUIElement!
    var textfieldDollars: XCUIElement!
    
    override func setUp() {
        super.setUp()
        
        // Print a warning about the keyboard
        print("If you are going to run the UI test on Simulator, please activate the option 'Toggle Software Keyboard', otherwise must of the test will fail..")
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // Launch app
        app = XCUIApplication()
        app.launch()
        
        // Gets a reference to main UI elements
        buttonConvert    = app.buttons["ButtonConvert"]
        textfieldDollars = app.textFields["TextfieldDollars"]
    }
    
    func test_NoZerosAllowedAtFirst() {
        
        // Write a zeros as first characters
        textfieldDollars.tap()
        app.keys["Delete"].tap()
        textfieldDollars.typeText("0000")
        
        // Textfield must be empty
        var dollarsText = textfieldDollars.value as! String
        XCTAssertEqual(dollarsText, "")
        
        // Tap convert button
        buttonConvert.tap()
        
        // Textfield must place a 1
        dollarsText = textfieldDollars.value as! String
        XCTAssertEqual(dollarsText, "1")
    }
    
    func test_EmptyDollarsAndTapConvert() {
        
        // Delete any content
        textfieldDollars.tap()
        app.keys["Delete"].tap()
        
        // Tap convert button
        buttonConvert.tap()
        
        // Textfield must place a 1
        let dollarsText = textfieldDollars.value as! String
        XCTAssertEqual(dollarsText, "1")
    }
    
    func test_EmptyDollarsAndTapCurrency() {
        
        // Delete any content
        textfieldDollars.tap()
        app.keys["Delete"].tap()
        
        // Tap the first cell
        app.tables.element.cells["GBP"].tap()
        
        // Textfield must place a 1
        let dollarsText = textfieldDollars.value as! String
        XCTAssertEqual(dollarsText, "1")
    }
    
    func test_AllCurrenciesExists() {
        
        // Tap all cells in order
        app.tables.element.cells["GBP"].tap()
        app.tables.element.cells["EUR"].tap()
        app.tables.element.cells["JPY"].tap()
        app.tables.element.cells["BRL"].tap()
        //
        app.tables.element.cells["AUD"].tap()
        app.tables.element.cells["BGN"].tap()
        app.tables.element.cells["CAD"].tap()
        app.tables.element.cells["CHF"].tap()
        app.tables.element.cells["CNY"].tap()
        app.tables.element.cells["CZK"].tap()
        app.tables.element.cells["DKK"].tap()
        app.tables.element.cells["HKD"].tap()
        app.tables.element.cells["HRK"].tap()
        app.tables.element.cells["HUF"].tap()
        app.tables.element.cells["IDR"].tap()
        app.tables.element.cells["ILS"].tap()
        app.tables.element.cells["INR"].tap()
        app.tables.element.cells["KRW"].tap()
        app.tables.element.cells["MXN"].tap()
        app.tables.element.cells["MYR"].tap()
        app.tables.element.cells["NOK"].tap()
        app.tables.element.cells["NZD"].tap()
        app.tables.element.cells["PHP"].tap()
        app.tables.element.cells["PLN"].tap()
        app.tables.element.cells["RON"].tap()
        app.tables.element.cells["RUB"].tap()
        app.tables.element.cells["SEK"].tap()
        app.tables.element.cells["SGD"].tap()
        app.tables.element.cells["THB"].tap()
        app.tables.element.cells["TRY"].tap()
        app.tables.element.cells["ZAR"].tap()
        
        // All cells are displayed correctly
        XCTAssert(true)
    }
    
}
