//
//  DataModels.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/6/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán. All rights reserved.
//

class DataModels: iAppLifeCycle {
    
    // --------------------------------------------------
    // Members
    // --------------------------------------------------
    
    var currencies = [Currency]()
    
    
    // --------------------------------------------------
    // Methods: App Life Cycle
    // --------------------------------------------------
    
    func doStart(){
        
        // Add all currencies
        currencies.append(Currency(code: eCurrencyCode.BritishPound))
        currencies.append(Currency(code: eCurrencyCode.Euro))
        currencies.append(Currency(code: eCurrencyCode.JapaneseYen))
        currencies.append(Currency(code: eCurrencyCode.BrazilianReal))
        //
        currencies.append(Currency(code: eCurrencyCode.AustralianDollar))
        currencies.append(Currency(code: eCurrencyCode.BulgarianLev))
        currencies.append(Currency(code: eCurrencyCode.CanadianDollar))
        currencies.append(Currency(code: eCurrencyCode.SwissFranc))
        currencies.append(Currency(code: eCurrencyCode.ChineseYuanRenminbi))
        currencies.append(Currency(code: eCurrencyCode.CzechKoruna))
        currencies.append(Currency(code: eCurrencyCode.DanishKrone))
        currencies.append(Currency(code: eCurrencyCode.HongKongDollar))
        currencies.append(Currency(code: eCurrencyCode.CroatianKuna))
        currencies.append(Currency(code: eCurrencyCode.HungarianForint))
        currencies.append(Currency(code: eCurrencyCode.IndonesianRupiah))
        currencies.append(Currency(code: eCurrencyCode.IsraeliShekel))
        currencies.append(Currency(code: eCurrencyCode.IndianRupee))
        currencies.append(Currency(code: eCurrencyCode.SouthKoreanWon))
        currencies.append(Currency(code: eCurrencyCode.MexicanPeso))
        currencies.append(Currency(code: eCurrencyCode.MalaysianRinggit))
        currencies.append(Currency(code: eCurrencyCode.NorwegianKrone))
        currencies.append(Currency(code: eCurrencyCode.NewZealandDollar))
        currencies.append(Currency(code: eCurrencyCode.PhilippinePeso))
        currencies.append(Currency(code: eCurrencyCode.PolishZloty))
        currencies.append(Currency(code: eCurrencyCode.RomanianNewLeu))
        currencies.append(Currency(code: eCurrencyCode.BelarusianRuble))
        currencies.append(Currency(code: eCurrencyCode.SwedishKrona))
        currencies.append(Currency(code: eCurrencyCode.SingaporeDollar))
        currencies.append(Currency(code: eCurrencyCode.ThaiBaht))
        currencies.append(Currency(code: eCurrencyCode.TurkishLira))
        currencies.append(Currency(code: eCurrencyCode.SouthAfricanRand))
    }
    
    func doPause(){
    }
    
    func doResume(){
    }
    
    func doExit(){
    }
    
    
    // --------------------------------------------------
    // Methods: Public Interface
    // --------------------------------------------------
    
    func getCurrencyName(currency: eCurrencyCode) -> String {
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
    
    
    // --------------------------------------------------
    // Singleton: Unique Instance
    // --------------------------------------------------
    private static let instance = DataModels()
    private init() {}
    
    // --------------------------------------------------
    // Singleton: One-Time Access
    // --------------------------------------------------
    private static var instanceDelivered = false
    
    /**
     Creates and returns the unique allowed instance of this class
     
     - returns: Unique instance the first time this method is called, nil otherwise
     */
    static func getUniqueInstance() -> DataModels? {
        
        // If this is the first time this method is called...
        if instanceDelivered == false {
            
            // Create and return the instance
            instanceDelivered = true
            return instance
        }
        return nil
    }
}