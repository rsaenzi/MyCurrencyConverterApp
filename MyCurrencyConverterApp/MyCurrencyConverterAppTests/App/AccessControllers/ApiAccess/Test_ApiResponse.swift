//
//  Test_ApiResponse.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
import Alamofire
@testable import MyCurrencyConverterApp

class Test_ApiResponse: XCTestCase {
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.control.apiResponse
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(ApiResponse.getUniqueInstance())
        }
    }
    
    func test_successGetExchangeRates_valid(){
        
        // Request configuration data
        let method = Alamofire.Method.GET
        let urlString = "https://api.fixer.io/latest?base=USD"
        
        // Request headers
        let headers = [
            "Content-Type": "application/json",
            "charset": "utf-8"
        ]
        
        // Create the request and print all its info
        let request = Alamofire.request(method, urlString, headers: headers)
        
        // Start the expectation
        weak var asyncExpectation = self.expectationWithDescription(#function)
        
        // Execute the request
        request.responseString { response in
            
            // If server gave us a proper response to our request
            if response.result.isSuccess {
                
                // Send the response to handler
                CurrencyConverter.app.control.apiResponse.successGetExchangeRates(response, onSuccess: { (response) in
                    
                    // Must inform the success of the data parsing
                    XCTAssert(response.responseCode == eResponseCodeGetExchangeRates.Success_200)
                    XCTAssert(response.responseMessage == "Success!")
                })   
            }
            
            // The wait can end
            if let async = asyncExpectation {
                async.fulfill()
            }
        }
        
        // Max waiting time for expectation
        self.waitForExpectationsWithTimeout(NSTimeInterval(30), handler: { (timeoutError) in
            
            // If an error was raised...
            if let error = timeoutError {
                
                // The test failed...
                XCTFail("Timeout in \(#function) expectation: \(error.localizedDescription)")
            }
        })
    }
    
    func test_successGetExchangeRates_BadUrl(){
        
        // Request configuration data
        let method = Alamofire.Method.GET
        let urlString = "https://api.fixer.io/latest?base=qwerty"
        
        // Request headers
        let headers = [
            "Content-Type": "application/json",
            "charset": "utf-8"
        ]
        
        // Create the request and print all its info
        let request = Alamofire.request(method, urlString, headers: headers)
        
        // Start the expectation
        weak var asyncExpectation = self.expectationWithDescription(#function)
        
        // Execute the request
        request.responseString { response in
            
            // If server gave us a proper response to our request
            if response.result.isSuccess {
                
                // Send the response to handler
                CurrencyConverter.app.control.apiResponse.successGetExchangeRates(response, onSuccess: { (response) in
                    
                    // An error must be reported...
                    XCTAssert(response.responseCode == eResponseCodeGetExchangeRates.ClientError_4XX)
                    XCTAssert(response.responseMessage.characters.count > 0)
                    
                    // No data must be provided...
                    XCTAssert(response.base  == String())
                    XCTAssert(response.date  == String())
                    XCTAssert(response.rates == [eCurrencyCode: Float]())
                })
            }
            
            // The wait can end
            if let async = asyncExpectation {
                async.fulfill()
            }
        }
        
        // Max waiting time for expectation
        self.waitForExpectationsWithTimeout(NSTimeInterval(30), handler: { (timeoutError) in
            
            // If an error was raised...
            if let error = timeoutError {
                
                // The test failed...
                XCTFail("Timeout in \(#function) expectation: \(error.localizedDescription)")
            }
        })
    }
    
    func test_successGetExchangeRates_badHeader(){
        
        // Request configuration data
        let method = Alamofire.Method.GET
        let urlString = "https://api.fixer.io/latest?base=USD"
        
        // Request headers
        let headers = [
            "Content-Type": "qwerty"
        ]
        
        // Create the request and print all its info
        let request = Alamofire.request(method, urlString, headers: headers)
        
        // Start the expectation
        weak var asyncExpectation = self.expectationWithDescription(#function)
        
        // Execute the request
        request.responseString { response in
            
            // If server gave us a proper response to our request
            if response.result.isSuccess {
                
                // Send the response to handler
                CurrencyConverter.app.control.apiResponse.successGetExchangeRates(response, onSuccess: { (response) in
                    
                    // Must inform the success of the data parsing
                    XCTAssert(response.responseCode == eResponseCodeGetExchangeRates.Success_200)
                    XCTAssert(response.responseMessage == "Success!")
                })
            }
            
            // The wait can end
            if let async = asyncExpectation {
                async.fulfill()
            }
        }
        
        // Max waiting time for expectation
        self.waitForExpectationsWithTimeout(NSTimeInterval(30), handler: { (timeoutError) in
            
            // If an error was raised...
            if let error = timeoutError {
                
                // The test failed...
                XCTFail("Timeout in \(#function) expectation: \(error.localizedDescription)")
            }
        })
    }
    
    func test_successGetExchangeRates_BadMethod(){
        
        // Request configuration data
        let method = Alamofire.Method.POST
        let urlString = "https://api.fixer.io/latest?base=USD"
        
        // Request headers
        let headers = [
            "Content-Type": "application/json",
            "charset": "utf-8"
        ]
        
        // Create the request and print all its info
        let request = Alamofire.request(method, urlString, headers: headers)
        
        // Start the expectation
        weak var asyncExpectation = self.expectationWithDescription(#function)
        
        // Execute the request
        request.responseString { response in
            
            // If server gave us a proper response to our request
            if response.result.isSuccess {
                
                // Send the response to handler
                CurrencyConverter.app.control.apiResponse.successGetExchangeRates(response, onSuccess: { (response) in
                    
                    // An error must be reported...
                    XCTAssert(response.responseCode == eResponseCodeGetExchangeRates.ClientError_4XX)
                    XCTAssert(response.responseMessage.characters.count > 0)
                    
                    // No data must be provided...
                    XCTAssert(response.base  == String())
                    XCTAssert(response.date  == String())
                    XCTAssert(response.rates == [eCurrencyCode: Float]())
                })
            }
            
            // The wait can end
            if let async = asyncExpectation {
                async.fulfill()
            }
        }
        
        // Max waiting time for expectation
        self.waitForExpectationsWithTimeout(NSTimeInterval(30), handler: { (timeoutError) in
            
            // If an error was raised...
            if let error = timeoutError {
                
                // The test failed...
                XCTFail("Timeout in \(#function) expectation: \(error.localizedDescription)")
            }
        })
    }
    
    
}
