//
//  WeatherData.swift
//  Clima
//
//  Created by 김희진 on 2022/05/16.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
