//
//  LoggerApi.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Alamofire

class LoggerApi {
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func printRequest(serverId: eServerId, request: Request, requestName: String){
        CurrencyConverter.app.control.log.console("--------------------------------------------------------------------------------")
        CurrencyConverter.app.control.log.console("RequestServer: \(serverId)")
        CurrencyConverter.app.control.log.console("RequestName: \(requestName) <<<<<")
        CurrencyConverter.app.control.log.console("RequestDescription: \(request.description)")
    }
    
    func printResponseStatus(response: Response<String, NSError>){
        CurrencyConverter.app.control.log.console("ResponseStatus: \(response.result.description)")
    }
    
    func printResponseSuccess(response: Response<String, NSError>){
        CurrencyConverter.app.control.log.console("ResponseHttpCode: \(response.response!.statusCode)")
    }
    
    func printResultInfo(responseCode: String, responseMessage: String, responseAsJsonString: String){
        CurrencyConverter.app.control.log.console("ResponseCode: \(responseCode)")
        CurrencyConverter.app.control.log.console("ResponseMessage: \(responseMessage)")
        CurrencyConverter.app.control.log.console("ResultRaw: \n\n\(responseAsJsonString)\n")
        CurrencyConverter.app.control.log.console("--------------------------------------------------------------------------------\n\n\n")
    }
    
    func printParameters(request: Request){
        
        // Gets the Command URL (cURL)
        let rawRequest = request.debugDescription
        
        // Cleans the results by several cleaning processes
        // - Deletes all '\' chars
        var cleanRequest = rawRequest.replace("\\", replacement: "")
        
        // - Deletes the first part of the command
        var split = cleanRequest.componentsSeparatedByString("-d \"")
        
        if split.count < 2 {
            
            // The command can not be splitted...
            CurrencyConverter.app.control.log.console("ParametersRaw: \n\n\(cleanRequest)\n")
            return
            
        }else{
            
            // Takes the valid part of the split...
            cleanRequest = split[1]
        }
        
        // - Deletes the second part of the command
        split = cleanRequest.componentsSeparatedByString("\"http")
        
        if split.count < 1 {
            
            // The command can not be splitted...
            CurrencyConverter.app.control.log.console("ParametersRaw: \n\n\(cleanRequest)\n")
            return
            
        }else{
            
            // Takes the valid part of the split...
            cleanRequest = split[0]
        }
        
        // - Deletes some waste chars at the end...
        let lastValidIndex = cleanRequest.rangeOfString("}", options: .BackwardsSearch)?.startIndex
        let finalString = cleanRequest.substringToIndex(lastValidIndex!.advancedBy(1))
        
        
        // Finally we print the json parameters for the request
        CurrencyConverter.app.control.log.console("ParametersRaw: \n\n\(finalString)\n")
    }
    
    func printHeaders(headers: [String: String]){
        for current in headers {
            CurrencyConverter.app.control.log.console("RequestHeader: \(current.0) = \(current.1)")
        }
    }
    
    func errorGeneral(response: Response<String, NSError>, onError: callbackError){
        
        // If error info is available
        if let errorInfo = response.result.error {
            
            // Get error info
            let httpCode = errorInfo.code
            let errorDescription = errorInfo.localizedDescription
            
            // Print error info
            CurrencyConverter.app.control.log.console("ResponseHttpCode: \(httpCode)")
            CurrencyConverter.app.control.log.console("ResultDescription: Wrong request -> \(errorDescription)")
            CurrencyConverter.app.control.log.console("--------------------------------------------------------------------------------")
            
            // Call the error callback
            onError(httpCode: httpCode, nsError: errorInfo, errorDescription: errorDescription)
            
        }else{
            
            // Print error info
            CurrencyConverter.app.control.log.console("ResultDescription: Not available")
            CurrencyConverter.app.control.log.console("--------------------------------------------------------------------------------")
            
            // Call the error callback
            onError(httpCode: -1, nsError: NSError(domain: "", code: -1, userInfo: nil), errorDescription: "Not available")
        }
    }
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = LoggerApi()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> LoggerApi? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}