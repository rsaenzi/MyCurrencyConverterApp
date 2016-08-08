//
//  AccessControllers.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class AccessControllers {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    var apiRequest  = ApiRequest.getUniqueInstance()!
    var apiResponse = ApiResponse.getUniqueInstance()!
    var json        = JsonParser.getUniqueInstance()!
    var log         = Logger.getUniqueInstance()!
    var valid       = Validation.getUniqueInstance()!
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = AccessControllers()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> AccessControllers? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}