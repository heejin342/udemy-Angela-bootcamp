//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol DidFetched {
    func didFailed(error: Error)
    func didFetched(_ coinManager: CoinManager, coin: Coin)
}

struct CoinManager {
    
    var delegate1: DidFetched?

    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
        
    func getCoinPrice(for cur: String) {
        
        let urlString = "\(baseURL)/\(cur)?apikey=8DF71B23-EB75-42F2-A33F-1D217428B82D"
        print(urlString)
        
        if let url = URL(string: urlString) {
            let sessgion = URLSession(configuration: .default)
            let task = sessgion.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate1?.didFailed(error: error!)
                    return
                }
                if let safeDate = data {
                    if let coinData = self.parseJSON(safeDate) {
                        self.delegate1?.didFetched(self, coin: coinData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Coin? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(Coin.self, from: data)
            let coinData = Coin(rate: decodedData.rate, asset_id_quote: decodedData.asset_id_quote)
            return coinData

        } catch {
            delegate1?.didFailed(error: error)
            return nil
        }
    }
}
