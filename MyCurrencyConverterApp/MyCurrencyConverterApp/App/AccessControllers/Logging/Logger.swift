//
//  Logger.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import Alamofire

class Logger {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    private var logsEnabled = true
    
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func toConsole(message: String){
        if logsEnabled == true {
            print("[Converter] \(message)")
        }
    }
    
    func printRequest(request: Request, requestName: String){
        toConsole("--------------------------------------------------------------------------------")
        toConsole("RequestName: \(requestName) <<<<<")
        toConsole("RequestDescription: \(request.description)")
    }
    
    func printResponseStatus(response: Response<String, NSError>){
        toConsole("ResponseStatus: \(response.result.description)")
    }
    
    func printResponseSuccess(response: Response<String, NSError>){
        toConsole("ResponseHttpCode: \(response.response!.statusCode)")
    }
    
    func printResultInfo(responseCode: String, responseMessage: String, responseAsJsonString: String){
        toConsole("ResponseCode: \(responseCode)")
        toConsole("ResponseMessage: \(responseMessage)")
        toConsole("ResultRaw: \n\n\(responseAsJsonString)\n")
        toConsole("--------------------------------------------------------------------------------\n\n\n")
    }
    
    func printHeaders(headers: [String: String]){
        for current in headers {
            toConsole("RequestHeader: \(current.0) = \(current.1)")
        }
    }
    
    func errorGeneral(response: Response<String, NSError>, onError: callbackError){
        
        // If error info is available
        if let errorInfo = response.result.error {
            
            // Get error info
            let httpCode = errorInfo.code
            let errorDescription = errorInfo.localizedDescription
            
            // Print error info
            toConsole("ResponseHttpCode: \(httpCode)")
            toConsole("ResultDescription: Wrong request -> \(errorDescription)")
            toConsole("--------------------------------------------------------------------------------")
            
            // Call the error callback
            onError(httpCode: httpCode, nsError: errorInfo, errorDescription: errorDescription)
            
        }else{
            
            // Print error info
            toConsole("ResultDescription: Not available")
            toConsole("--------------------------------------------------------------------------------")
            
            // Call the error callback
            onError(httpCode: -1, nsError: NSError(domain: "", code: -1, userInfo: nil), errorDescription: "Not available")
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