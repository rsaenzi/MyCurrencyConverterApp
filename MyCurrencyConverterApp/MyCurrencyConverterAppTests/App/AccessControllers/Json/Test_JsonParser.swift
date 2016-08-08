//
//  Test_JsonParser.swift
//  MyCurrencyConverterApp
//
//  Created by Rigoberto Sáenz Imbacuán on 8/7/16.
//  Copyright © 2016 Rigoberto Sáenz Imbacuán [https://www.linkedin.com/in/rsaenzi]. All rights reserved.
//

import XCTest
@testable import MyCurrencyConverterApp

class Test_JsonParser: XCTestCase {
    
    let validJson = "{\"base\":\"USD\",\"date\":\"2016-08-05\",\"rates\":{\"AUD\":1.3058,\"BGN\":1.7531,\"BRL\":3.1822,\"CAD\":1.3023,\"CHF\":0.97275,\"CNY\":6.6431,\"CZK\":24.222,\"DKK\":6.6666,\"GBP\":0.76022,\"HKD\":7.7556,\"HRK\":6.7088,\"HUF\":278.43,\"IDR\":13103.0,\"ILS\":3.8215,\"INR\":66.773,\"JPY\":101.05,\"KRW\":1109.5,\"MXN\":18.849,\"MYR\":4.0272,\"NOK\":8.4279,\"NZD\":1.387,\"PHP\":46.881,\"PLN\":3.8402,\"RON\":3.9998,\"RUB\":65.253,\"SEK\":8.5195,\"SGD\":1.3404,\"THB\":34.823,\"TRY\":3.0003,\"ZAR\":13.673,\"EUR\":0.89638}}"
    
    func test_getUniqueInstance() {
        
        // Only the first call should receive a valid instance...
        let _ = CurrencyConverter.app.control.json
        
        // After the first call ge must get nil...
        for _ in 0...10 {
            XCTAssertNil(JsonParser.getUniqueInstance())
        }
    }
    
    func test_parseSuccessGetExchangeRates_valid(){
        
        // Case: Valid json
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(validJson)
        
        // Must inform the success of the data parsing
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.Success_200)
        XCTAssert(parsedResponse.responseMessage == "Success!")
        
        // All data must correspond to the json input
        XCTAssert(parsedResponse.base == "USD")
        XCTAssert(parsedResponse.date == "2016-08-05")
        XCTAssert(parsedResponse.rates[eCurrencyCode.AustralianDollar   ] == 1.3058)
        XCTAssert(parsedResponse.rates[eCurrencyCode.BulgarianLev       ] == 1.7531)
        XCTAssert(parsedResponse.rates[eCurrencyCode.BrazilianReal      ] == 3.1822)
        XCTAssert(parsedResponse.rates[eCurrencyCode.CanadianDollar     ] == 1.3023)
        XCTAssert(parsedResponse.rates[eCurrencyCode.SwissFranc         ] == 0.97275)
        XCTAssert(parsedResponse.rates[eCurrencyCode.ChineseYuanRenminbi] == 6.6431)
        XCTAssert(parsedResponse.rates[eCurrencyCode.CzechKoruna        ] == 24.222)
        XCTAssert(parsedResponse.rates[eCurrencyCode.DanishKrone        ] == 6.6666)
        XCTAssert(parsedResponse.rates[eCurrencyCode.BritishPound       ] == 0.76022)
        XCTAssert(parsedResponse.rates[eCurrencyCode.HongKongDollar     ] == 7.7556)
        XCTAssert(parsedResponse.rates[eCurrencyCode.CroatianKuna       ] == 6.7088)
        XCTAssert(parsedResponse.rates[eCurrencyCode.HungarianForint    ] == 278.43)
        XCTAssert(parsedResponse.rates[eCurrencyCode.IndonesianRupiah   ] == 13103)
        XCTAssert(parsedResponse.rates[eCurrencyCode.IsraeliShekel      ] == 3.8215)
        XCTAssert(parsedResponse.rates[eCurrencyCode.IndianRupee        ] == 66.773)
        XCTAssert(parsedResponse.rates[eCurrencyCode.JapaneseYen        ] == 101.05)
        XCTAssert(parsedResponse.rates[eCurrencyCode.SouthKoreanWon     ] == 1109.5)
        XCTAssert(parsedResponse.rates[eCurrencyCode.MexicanPeso        ] == 18.849)
        XCTAssert(parsedResponse.rates[eCurrencyCode.MalaysianRinggit   ] == 4.0272)
        XCTAssert(parsedResponse.rates[eCurrencyCode.NorwegianKrone     ] == 8.4279)
        XCTAssert(parsedResponse.rates[eCurrencyCode.NewZealandDollar   ] == 1.387)
        XCTAssert(parsedResponse.rates[eCurrencyCode.PhilippinePeso     ] == 46.881)
        XCTAssert(parsedResponse.rates[eCurrencyCode.PolishZloty        ] == 3.8402)
        XCTAssert(parsedResponse.rates[eCurrencyCode.RomanianNewLeu     ] == 3.9998)
        XCTAssert(parsedResponse.rates[eCurrencyCode.BelarusianRuble    ] == 65.253)
        XCTAssert(parsedResponse.rates[eCurrencyCode.SwedishKrona       ] == 8.5195)
        XCTAssert(parsedResponse.rates[eCurrencyCode.SingaporeDollar    ] == 1.3404)
        XCTAssert(parsedResponse.rates[eCurrencyCode.ThaiBaht           ] == 34.823)
        XCTAssert(parsedResponse.rates[eCurrencyCode.TurkishLira        ] == 3.0003)
        XCTAssert(parsedResponse.rates[eCurrencyCode.SouthAfricanRand   ] == 13.673)
        XCTAssert(parsedResponse.rates[eCurrencyCode.Euro               ] == 0.89638)
    }
    
    func test_parseSuccessGetExchangeRates_invalidBase(){
        
        // Makes the json invalid
        let jsonToTest = validJson.replace("base", replacement: "XYZ")
        
        // Case: Field 'base' invalid
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonToTest)
        
        // An error must be reported...
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.JsonParseError_AP0)
        XCTAssert(parsedResponse.responseMessage.characters.count > 0)
        
        // No data must be provided...
        XCTAssert(parsedResponse.base  == String())
        XCTAssert(parsedResponse.date  == String())
        XCTAssert(parsedResponse.rates == [eCurrencyCode: Float]())
    }
    
    func test_parseSuccessGetExchangeRates_invalidDate(){
        
        // Makes the json invalid
        let jsonToTest = validJson.replace("date", replacement: "XYZ")
        
        // Case: Field 'base' invalid
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonToTest)
        
        // An error must be reported...
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.JsonParseError_AP0)
        XCTAssert(parsedResponse.responseMessage.characters.count > 0)
        
        // No data must be provided...
        XCTAssert(parsedResponse.base  == String())
        XCTAssert(parsedResponse.date  == String())
        XCTAssert(parsedResponse.rates == [eCurrencyCode: Float]())
    }
    
    func test_parseSuccessGetExchangeRates_invalidRates(){
        
        // Makes the json invalid
        let jsonToTest = validJson.replace("rates", replacement: "XYZ")
        
        // Case: Field 'base' invalid
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonToTest)
        
        // An error must be reported...
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.JsonParseError_AP0)
        XCTAssert(parsedResponse.responseMessage.characters.count > 0)
        
        // No data must be provided...
        XCTAssert(parsedResponse.base  == String())
        XCTAssert(parsedResponse.date  == String())
        XCTAssert(parsedResponse.rates == [eCurrencyCode: Float]())
    }
    
    func test_parseSuccessGetExchangeRates_invalidNameAUD(){
        
        // Makes the json invalid
        let jsonToTest = validJson.replace("AUD", replacement: "XYZ")
        
        // Case: Field 'base' invalid
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonToTest)
        
        // An error must be reported...
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.JsonParseError_AP0)
        XCTAssert(parsedResponse.responseMessage.characters.count > 0)
        
        // No data must be provided...
        XCTAssert(parsedResponse.base  == String())
        XCTAssert(parsedResponse.date  == String())
        XCTAssert(parsedResponse.rates == [eCurrencyCode: Float]())
    }
    
    func test_parseSuccessGetExchangeRates_invalidContentAUD(){
        
        // Makes the json invalid
        let jsonToTest = validJson.replace("1.3058", replacement: "XYZ")
        
        // Case: Field 'base' invalid
        let parsedResponse = CurrencyConverter.app.control.json.parseSuccessGetExchangeRates(jsonToTest)
        
        // An error must be reported...
        XCTAssert(parsedResponse.responseCode == eResponseCodeGetExchangeRates.JsonParseError_AP0)
        XCTAssert(parsedResponse.responseMessage.characters.count > 0)
        
        // No data must be provided...
        XCTAssert(parsedResponse.base  == String())
        XCTAssert(parsedResponse.date  == String())
        XCTAssert(parsedResponse.rates == [eCurrencyCode: Float]())
    }
    
}

