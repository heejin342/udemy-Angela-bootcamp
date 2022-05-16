//
//  Coin.swift
//  ByteCoin
//
//  Created by 김희진 on 2022/05/16.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Coin: Decodable{
    let rate: Float
    let asset_id_quote: String
}
