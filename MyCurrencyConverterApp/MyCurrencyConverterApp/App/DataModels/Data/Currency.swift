//
//  Currency.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class Currency {
    
    // Images
    var landscape: UIImage
    var flag: UIImage
    
    // Texts
    var name: String
    var rate: Float
    
    // Code
    var code: eCurrencyCode
    
    
    init(code: eCurrencyCode) {
        
        // Init values
        self.code = code
        self.rate = 1.0
        
        // Load info
        self.name      = Currency.getName(code)
        self.flag      = CurrencyConverter.app.view.loadImage("Flag\(code.rawValue)")
        self.landscape = CurrencyConverter.app.view.loadImage("Land\(code.rawValue)")
    }
    
    
    private static func getName(currency: eCurrencyCode) -> String {
        switch currency {
        case .AustralianDollar:     return "Australian Dollar"
        case .BulgarianLev:         return "Bulgarian Lev"
        case .BrazilianReal:        return "Brazilian Real"
        case .CanadianDollar:       return "Canadian Dollar"
        case .SwissFranc:           return "Swiss Franc"
        case .ChineseYuanRenminbi:  return "Chinese Yuan Renminbi"
        case .CzechKoruna:          return "Czech Koruna"
        case .DanishKrone:          return "Danish Krone"
        case .BritishPound:         return "British Pound"
        case .HongKongDollar:       return "Hong Kong Dollar"
        case .CroatianKuna:         return "Croatian Kuna"
        case .HungarianForint:      return "Hungarian Forint"
        case .IndonesianRupiah:     return "Indonesian Rupiah"
        case .IsraeliShekel:        return "Israeli Shekel"
        case .IndianRupee:          return "Indian Rupee"
        case .JapaneseYen:          return "Japanese Yen"
        case .SouthKoreanWon:       return "South Korean Won"
        case .MexicanPeso:          return "Mexican Peso"
        case .MalaysianRinggit:     return "Malaysian Ringgit"
        case .NorwegianKrone:       return "Norwegian Krone"
        case .NewZealandDollar:     return "New Zealand Dollar"
        case .PhilippinePeso:       return "Philippine Peso"
        case .PolishZloty:          return "Polish Zloty"
        case .RomanianNewLeu:       return "Romanian New Leu"
        case .BelarusianRuble:      return "Belarusian Ruble"
        case .SwedishKrona:         return "Swedish Krona"
        case .SingaporeDollar:      return "Singapore Dollar"
        case .ThaiBaht:             return "Thai Baht"
        case .TurkishLira:          return "Turkish Lira"
        case .SouthAfricanRand:     return "South African Rand"
        case .Euro:                 return "Euro"
        }
    }
    
}