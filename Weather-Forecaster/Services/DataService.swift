//
//  DataService.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 05/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    
    private init() {}
    
    var weatherArray = [Weather]()
    
    static let instance = DataService()
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        if let currentWeatherURL = URL(string: CURRENT_WEATHER_URL) {
            Alamofire.request(currentWeatherURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.result.error == nil {
                    let result = response.result.value
                    
                    guard let dict = result as? Dictionary<String, Any> else {return}
                    
                    guard let cityName = dict["name"] as? String else {return}
                    
                    guard let weather = dict["weather"] as? [Dictionary<String, Any>] else {return}
                    guard let weatherType = weather[0]["main"] as? String else {return}
                    
                    guard let main = dict["main"] as? Dictionary<String, Any> else {return}
                    guard let currentTemperature = main["temp"] as? Double else {return}
                    let kelvinToFarenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                    let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                     
                    let weatherObj = Weather(cityName: cityName, weatherType: weatherType, currentTemp: kelvinToFarenheit)
                    self.weatherArray.append(weatherObj)
                    
                    completed(true)
                } else {
                    print("Error")
                    completed(false)
                }
                
            }
        }
    }
}
