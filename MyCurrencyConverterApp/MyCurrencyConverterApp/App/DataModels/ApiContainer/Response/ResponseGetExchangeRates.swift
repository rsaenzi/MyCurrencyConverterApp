//
//  ResponseGetExchangeRates.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

struct ResponseGetExchangeRates {
    
    // Main response
    var responseCode    = eResponseCodeGetExchangeRates.UnknownError_AP1
    var responseMessage = String()
    
    // Content
    var base  = String()
    var date  = String()
    var rates = [eCurrencyCode: Float]()
}