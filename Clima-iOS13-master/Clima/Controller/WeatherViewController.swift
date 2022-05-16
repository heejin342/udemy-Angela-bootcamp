//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, DidUpdateWeather {
    
    @IBOutlet var searchTF: UITextField!
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        weatherManager.delegate = self
        searchTF.delegate = self
    }
    
    @IBAction func searchPressed(_ sender: Any) {
        searchTF.endEditing(true)
        print(searchTF.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTF.endEditing(true)

        print(searchTF.text!)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTF.text {
            weatherManager.fetchWeather(cityName: city)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func didUpdateWeather(_ weaterhManager: WeatherManager, weather: WeatherModal){
        print(weather.tempreture)
        DispatchQueue.main.async { [self] in
            temperatureLabel.text = weather.tempratureString
            cityLabel.text = weather.cityName
            conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailedWithError(error: Error) {
        print(error)
    }
    

}

