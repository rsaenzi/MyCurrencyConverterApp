//
//  StringExtension.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import Foundation

extension String {
    
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func noSpaces() -> String {
        return self.replace(" ", replacement: "")
    }
    
    func contains(find: String) -> Bool{
        return self.rangeOfString(find) != nil
    }
}