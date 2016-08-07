//
//  Currency.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class Currency {
    
    // Images
    var landscape: UIImage
    var flag: UIImage
    
    // Texts
    var name: String
    var rate: Float
    
    // Code
    var code: eCurrencyCode
    
    
    init(code: eCurrencyCode) {
        
        // Init values
        self.code = code
        self.rate = 1.0
        
        // Load info
        self.name      = CurrencyConverter.app.model.getCurrencyName(code)
        self.flag      = CurrencyConverter.app.view.loadImage("Flag\(code.rawValue)")
        self.landscape = CurrencyConverter.app.view.loadImage("Land\(code.rawValue)")
    }
    
}