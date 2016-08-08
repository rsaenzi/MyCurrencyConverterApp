//
//  AppDelegate.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/5/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // --------------------------------------------------
    // Life Cycle
    // --------------------------------------------------
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        CurrencyConverter.app.doStart()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        //CurrencyConverter.app.doPause()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        //CurrencyConverter.app.doResume()
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
    }
    
    func applicationWillTerminate(application: UIApplication) {
        //CurrencyConverter.app.doExit()
    }
}