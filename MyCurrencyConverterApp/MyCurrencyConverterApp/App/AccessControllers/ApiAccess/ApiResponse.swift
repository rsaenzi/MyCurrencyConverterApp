//
//  ApiResponse.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Alamofire

typealias callbackError                     = (httpCode: Int, nsError: NSError, errorDescription: String) -> ()
typealias callbackSuccessGetExchangeRates   = (response: ResponseGetExchangeRates) -> ()

class ApiResponse {
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func successGetExchangeRates(response: Response<String, NSError>, onSuccess: callbackSuccessGetExchangeRates){
        
        // Response values
        let jsonString = response.result.value!
        let httpCode   = response.response!.statusCode
        
        // Result values
        var responseContainer = ResponseGetExchangeRates()
        
        switch httpCode {
            
        // Success
        case 200:
            responseContainer = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonString)
            
        // Standard Errors
        case 400..<500:
            responseContainer.responseMessage = "Client error."
            responseContainer.responseCode    = .ClientError_4XX
            
        case 500..<600:
            responseContainer.responseMessage = "Server error."
            responseContainer.responseCode    = .ServerError_5XX
            
        default:
            responseContainer.responseMessage = "Unknown error."
            responseContainer.responseCode    = .UnknownError_AP1
        }
        
        // Send Response
        CurrencyConverter.app.control.log.printResultInfo(responseContainer.responseCode.rawValue, responseMessage: responseContainer.responseMessage, responseAsJsonString: jsonString)
        onSuccess(response: responseContainer)
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = ApiResponse()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> ApiResponse? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}