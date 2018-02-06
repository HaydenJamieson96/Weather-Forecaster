//
//  LocationServices.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 06/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import Foundation
import CoreLocation

class LocationServices {
    
    private init() {}
    
    static let instance = LocationServices()
    
    var latitude: Double!
    var longitude: Double!
    
    func configureLatAndLong(withLocation location: CLLocation) {
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        print(self.longitude)
        print(self.latitude)
    }
    
}
