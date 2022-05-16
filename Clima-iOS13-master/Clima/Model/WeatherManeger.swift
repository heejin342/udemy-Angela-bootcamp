//
//  WeatherManeger.swift
//  Clima
//
//  Created by 김희진 on 2022/05/16.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol DidUpdateWeather{
    func didUpdateWeather(_ weaterhManager: WeatherManager, weather: WeatherModal)
    func didFailedWithError(error: Error)
}

struct WeatherManager {

    var delegate: DidUpdateWeather?
    
    let weatherURL =  ""
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitute: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitute)"
        print(urlString)
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {
        //1. create URL
        if let url = URL(string: urlString) {
            // 2. create URLSession
            let session = URLSession(configuration: .default)
            
            // 3. give a task to URLSession
            let task = session.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    self.delegate?.didFailedWithError(error: error!)
                    return
                }
                
                if let safeDate = data {
                    if let weather = self.parseJSON(safeDate) {
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            // 4. start task
            task.resume()
        }
    }
    
    func parseJSON(_ weaderData: Data) -> WeatherModal? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weaderData)

            print(decodedData.main.temp)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name

            let weather = WeatherModal(conditionId: id, cityName: name, tempreture: temp)
            return weather

        } catch {
            print(error)
            return nil
        }
    }
    
}
