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
    
    static let instance = DataService()
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        if let currentWeatherURL = URL(string: CURRENT_WEATHER_URL) {
            Alamofire.request(currentWeatherURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                if response.result.error == nil {
                    let result = response.result.value
                    print(result as Any)
                    completed(true)
                } else {
                    print("Error")
                    completed(false)
                }
                
            }
        }
    }
}
