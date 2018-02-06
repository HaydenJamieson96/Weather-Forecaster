//
//  Constants.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 05/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation

let API_KEY = "e104cff114cbeb088829d6a1f11a8ad6"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=e104cff114cbeb088829d6a1f11a8ad6"

typealias DownloadComplete = (_ Success: Bool) -> ()


