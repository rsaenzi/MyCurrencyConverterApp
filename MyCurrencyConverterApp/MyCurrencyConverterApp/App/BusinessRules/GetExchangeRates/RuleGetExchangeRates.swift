//
//  RuleGetExchangeRates.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

typealias callbackSuccessRuleResponse = () -> ()

class RuleGetExchangeRates {
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    private let errorMessage = "An error has occurred... Please verify your Internet connection and try again later..."
    
    func executeRule(screen: ScreenConverter, callback: callbackSuccessRuleResponse){
        
        // Make the request
        CurrencyConverter.app.control.apiRequest.endpointGetExchangeRates({ (response) in
            
            switch response.responseCode {
                
            // Success
            case .Success_200:
                
                // Saves the rates into the app model
                for currency in CurrencyConverter.app.model.currencies {
                    currency.rate = response.rates[currency.code]!
                }
                
                // Calls the success callback
                callback()
                break
                
            // Standard Errors
            default:
                CurrencyConverter.app.view.showSimpleAlert(screen, message: self.errorMessage)
            }
            
        }) { (httpCode, nsError, errorDescription) in
            CurrencyConverter.app.view.showSimpleAlert(screen, message: self.errorMessage)
        }
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = RuleGetExchangeRates()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> RuleGetExchangeRates? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}