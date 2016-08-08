//
//  ViewManagers.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import UIKit

class ViewManagers {
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func loadImage(imageName: String) -> UIImage{
        if let image = UIImage(named: "\(imageName)") {
            return image
        }else{
            return UIImage()
        }
    }
    
    func showSimpleAlert(screen: UIViewController, message: String){
        
        // Create the OK button
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        // Create and cofigure the alert
        let alert = UIAlertController(title: "Currency Converter", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(alertActionOK)
        
        // Display the alert
        screen.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = ViewManagers()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> ViewManagers? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}