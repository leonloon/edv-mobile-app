//
//  Currency.swift
//  Currencies
//
//  Created by Leon on 02/02/2018.
//  Copyright © 2018 Leon. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Currency: NSObject {
    
    let name: String
    let rate: Float
    
    init(name: String, rate: Float) {
        self.name = name
        self.rate = rate
    }
}

class CurrencyLoader {
    
    var rates = [Currency]()
    
    func fetchData(baseCurrency: String, completionHandler: @escaping ([Currency]?, Error?) -> ()) {
        makeCall(baseCurrency: baseCurrency, completionHandler: completionHandler)
    }
    
    func makeCall(baseCurrency: String, completionHandler: @escaping ([Currency]?, Error?) -> ()) {
        let url = "https://api.fixer.io/latest?base=\(baseCurrency)"
        Alamofire.request(url).responseJSON { (response) -> Void in
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                let rates = json["rates"]

                for (key, value) in rates {
                    
                    self.rates.append(Currency(name: key, rate: value.floatValue))
                }

                completionHandler(self.rates as [Currency], nil)
            }
        }
    }
}
