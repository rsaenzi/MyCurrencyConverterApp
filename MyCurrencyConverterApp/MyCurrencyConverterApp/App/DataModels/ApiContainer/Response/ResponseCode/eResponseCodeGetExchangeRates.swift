//
//  eResponseCodeGetExchangeRates.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

enum eResponseCodeGetExchangeRates: String {
    
    // Success
    case Success_200
    
    // Standard Errors
    case ClientError_4XX
    case ServerError_5XX
    case JsonParseError_AP0
    case UnknownError_AP1
}