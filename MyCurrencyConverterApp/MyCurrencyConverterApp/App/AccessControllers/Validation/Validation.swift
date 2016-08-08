//
//  Validation.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class Validation {
    
    // --------------------------------------------------
    // Text Validators
    // --------------------------------------------------
    
    private let numericChars = "0123456789"
    
    func isStringOnlyNumeric(stringToTest: String) -> Bool {
        if stringToTest.characters.count > 0 && testCharset(stringToTest, charset: numericChars) == true {
            return true
        }else {
            return false
        }
    }
    
    private func testCharset(stringToTest: String, charset: String) -> Bool {
        
        let characterset = NSCharacterSet(charactersInString: charset)
        
        if stringToTest.rangeOfCharacterFromSet(characterset.invertedSet) != nil {
            return false
        }
        
        return true
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = Validation()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> Validation? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}