//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet var searchTF: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    var locationManager = CLLocationManager()
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() //권한 물어보기
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTF.delegate = self
    }
 
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate1
//MARK: - UITextFieldDelegate2
extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: Any) {
        print(searchTF.text!)
        searchTF.endEditing(true)
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
}

//MARK: - DidUpdateWeather1
//heejin's MARK: - DidUpdateWeather2
extension WeatherViewController: DidUpdateWeather {
    
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

//heejin's MARK: - CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got")
        if let location = locations.last {
            locationManager.stopUpdatingLocation()

            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitute: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
