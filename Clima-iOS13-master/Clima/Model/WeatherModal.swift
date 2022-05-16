//
//  WeatherModal.swift
//  Clima
//
//  Created by 김희진 on 2022/05/16.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModal {
    let conditionId: Int
    let cityName: String
    let tempreture: Double

    var tempratureString: String {
        return String(format: "%.1f", tempreture)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snpw"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}
