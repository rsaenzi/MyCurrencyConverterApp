//
//  BusinessRules.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

class BusinessRules: iAppLifeCycle {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    var rates = RuleGetExchangeRates.getUniqueInstance()!
    
    
    // --------------------------------------------------
    // Methods: App Life Cycle
    // --------------------------------------------------
    func doStart(){
    }
    
    func doPause(){
    }
    
    func doResume(){
    }
    
    func doExit(){
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = BusinessRules()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> BusinessRules? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}