//
//  Logger.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

class Logger {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    private var logsEnabled = true
    
    var api = LoggerApi.getUniqueInstance()!
    
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    func console(message: String){
        if logsEnabled == true {
            print("[Converter] \(message)")
        }
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = Logger()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> Logger? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}