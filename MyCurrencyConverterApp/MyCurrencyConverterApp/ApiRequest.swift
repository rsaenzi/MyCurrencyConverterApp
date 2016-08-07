//
//  ApiRequest.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Alamofire

class ApiRequest {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    
    // Servers
    private var serverId            = eServerId.Sandbox
    private var serverUrlProduction = "https://api.fixer.io"
    private var serverUrlSandbox    = "https://api.fixer.io"
    
    // Endpoints
    private let endpointGetExchangeRatesURL = /* GET */ "/latest?base=USD"
    
    
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func endpointGetExchangeRates(onSuccess: callbackSuccessGetExchangeRates, onError: callbackError){
        
        // Request configuration data
        let method = Alamofire.Method.GET
        let urlString = "\(getServerUrl())\(endpointGetExchangeRatesURL)"
        
        // Request headers
        let headers = [
            "Content-Type": "application/json",
            "charset": "utf-8"
        ]
        
        // Create the request and print all its info
        let request = Alamofire.request(method, urlString, headers: headers)
        CurrencyConverter.app.control.log.api.printRequest(serverId, request: request, requestName: #function)
        CurrencyConverter.app.control.log.api.printHeaders(headers)
        
        // Execute the request
        request.responseString { response in
            CurrencyConverter.app.control.log.api.printResponseStatus(response)
            
            // If server gave us a proper response to our request
            if response.result.isSuccess {
                
                CurrencyConverter.app.control.log.api.printResponseSuccess(response)
                CurrencyConverter.app.control.apiResponse.successGetExchangeRates(response, onSuccess: onSuccess)
                
            }else { // Error flow
                CurrencyConverter.app.control.log.api.errorGeneral(response, onError: onError)
            }
        }
    }
    
    
    // --------------------------------------------------
    // Methods: Internal Behaviour
    // --------------------------------------------------
    
    private func getServerUrl() -> String {
        
        switch serverId {
        case .Production: return serverUrlProduction
        case .Sandbox:    return serverUrlSandbox
        }
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = ApiRequest()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> ApiRequest? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}