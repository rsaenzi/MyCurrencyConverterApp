//
//  CurrencyConverter.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

class CurrencyConverter {
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    static let app = CurrencyConverter()
    private init() {}
    
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    var model   = DataModels.getUniqueInstance()!
    var brules  = BusinessRules.getUniqueInstance()!
    var control = AccessControllers.getUniqueInstance()!
    var view    = ViewManagers.getUniqueInstance()!
    
    
    // --------------------------------------------------
    // Methods: App Life Cycle
    // --------------------------------------------------
    func doStart(){
        model.doStart()
    }
}
