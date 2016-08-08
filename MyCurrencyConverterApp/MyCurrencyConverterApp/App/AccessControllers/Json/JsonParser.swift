//
//  JsonParser.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import SwiftyJSON

class JsonParser {
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func parseSuccessGetExchangeRates(responseAsJsonString: String) -> ResponseGetExchangeRates {
        
        // Default Value: No parsing errors
        var answer = ResponseGetExchangeRates()
        answer.responseMessage = "Success!"
        answer.responseCode    = .Success_200
        
        // ------------------------------------
        
        let jsonTree = SwiftyJSON.JSON.parse(responseAsJsonString)
        if jsonTree.isEmpty == false {
            
            // Value: Base
            if let value = jsonTree["base"].string {
                answer.base = value
            }else{
                answer.responseMessage = "Json Error: 'base' value not found..."
                answer.responseCode    = .JsonParseError_AP0
            }
            
            // Value: Date
            if let value = jsonTree["date"].string {
                answer.date = value
            }else{
                answer.responseMessage = "Json Error: 'date' value not found..."
                answer.responseCode    = .JsonParseError_AP0
            }
            
            // Container: Rates
            if let ratesContainer: JSON = jsonTree["rates"] {
                
                // For every supported currency...
                for currency in CurrencyConverter.app.model.currencies {
                    
                    // Get the currency code name
                    let codeName = currency.code.rawValue
                    
                    // Value: Currency
                    if let value = ratesContainer[codeName].float {
                        answer.rates[currency.code] = value
                    }else{
                        answer.responseMessage = "Json Error: '\(codeName)' value not found..."
                        answer.responseCode    = .JsonParseError_AP0
                    }
                }
                
            }else{
                answer.responseMessage = "Json Error: 'rates' value not found..."
                answer.responseCode    = .JsonParseError_AP0
            }
            
        }else{
            answer.responseMessage = "Json Error: No JSON data found..."
            answer.responseCode    = .JsonParseError_AP0
        }
        
        // ------------------------------------
        
        // If any error was detected, we delete any parsed data...
        if answer.responseCode != .Success_200 {
            answer.base  = String()
            answer.date  = String()
            answer.rates = [eCurrencyCode: Float]()
        }
        
        return answer
    }
    
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = JsonParser()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> JsonParser? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}