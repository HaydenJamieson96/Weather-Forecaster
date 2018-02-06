//
//  Forecast.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 06/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String {
        return _date ?? ""
    }
    
    var weatherType: String {
        return _weatherType ?? ""
    }
    
    var highTemp: String {
        return _highTemp ?? ""
    }
    
    var lowTemp: String {
        return _lowTemp ?? ""
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        guard let main = weatherDict["main"] as? Dictionary<String, Any> else {return}
        
        guard let min = main["temp_min"] as? Double else {return}
        let kelvinToFarenheitPreDivisionMin = (min * (9/5) - 459.67)
        let kelvinToFarenheitMin = Double(round(10 * kelvinToFarenheitPreDivisionMin/10))
        self._lowTemp = "\(kelvinToFarenheitMin)"
        
        guard let max = main["temp_max"] as? Double else {return}
        let kelvinToFarenheitPreDivisionMax = (max * (9/5) - 459.67)
        let kelvinToFarenheitMax = Double(round(10 * kelvinToFarenheitPreDivisionMax/10))
        self._highTemp = "\(kelvinToFarenheitMax)"
        
        guard let weather = weatherDict["weather"] as? [Dictionary<String, Any>] else {return}
        let mainType = weather[0]["main"] as? String
        self._weatherType = mainType
        
        guard let date = weatherDict["dt"] as? Double else {return}
        let unixConvertedDate = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeStyle = .none
        self._date = unixConvertedDate.dayOfTheWeek()
    }
    
}

extension Date {
    
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
}
