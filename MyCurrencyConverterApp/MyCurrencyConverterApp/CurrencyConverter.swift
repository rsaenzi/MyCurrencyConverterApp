//
//  CurrencyConverter.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

class CurrencyConverter: iAppLifeCycle {
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    static let app = CurrencyConverter()
    private init() {}
    
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    private var allComponents = [iAppLifeCycle]()
    
    var model   = DataModels.getUniqueInstance()!
    var brules  = BusinessRules.getUniqueInstance()!
    var control = AccessControllers.getUniqueInstance()!
    var view    = ViewManagers.getUniqueInstance()!
    
    
    // --------------------------------------------------
    // Methods: App Life Cycle
    // --------------------------------------------------
    func doStart(){
        
        // Group all components
        allComponents.append(model)
        allComponents.append(brules)
        allComponents.append(control)
        allComponents.append(view)
        
        // Propagate the doStart event
        for component in allComponents {
            component.doStart()
        }
    }
    
    func doPause(){
        // Propagate the doPause event
        for component in allComponents {
            component.doPause()
        }
    }
    
    func doResume(){
        // Propagate the doResume event
        for component in allComponents {
            component.doResume()
        }
    }
    
    func doExit(){
        // Propagate the doExit event
        for component in allComponents {
            component.doExit()
        }
    }
}
