//
//  iAppLifeCycle.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

protocol iAppLifeCycle {
    
    func doStart()
    
    func doPause()
    
    func doResume()
    
    func doExit()
}