//
//  Weather.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 05/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit

class Weather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        return _cityName ?? ""
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date ?? ""
    }
    
    var weatherType: String {
        return _weatherType ?? ""
    }
    
    var currentTemp: Double {
        return _currentTemp ?? 0.0
    }
    
    init(cityName: String, weatherType: String, currentTemp: Double) {
        self._cityName = cityName
        self._weatherType = weatherType
        self._currentTemp = currentTemp
    }
    
}
