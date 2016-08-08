//
//  Test_ApiRequest.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_ApiRequest: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.control.apiRequest
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(ApiRequest.getUniqueInstance())
        }
    }
    
    func test_endpointGetExchangeRates(){
        
        // Make the request
        CurrencyConverter.app.control.apiRequest.endpointGetExchangeRates({ (response) in
            
            // Must inform the success of the data parsing
            XCTAssert(response.responseCode == eResponseCodeGetExchangeRates.Success_200)
            XCTAssert(response.responseMessage == "Success!")
            
        }) { (httpCode, nsError, errorDescription) in
            
            // Data can no be fetched...
            XCTFail()
        }
    }
    
}
