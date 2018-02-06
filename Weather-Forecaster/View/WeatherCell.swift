//
//  WeatherCell.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 05/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherTypelbl: UILabel!
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    func configureCell(withForecastObject forecast: Forecast) {
        self.dayLbl.text = forecast.date
        self.weatherTypelbl.text = forecast.weatherType
        self.highTempLbl.text = forecast.highTemp
        self.lowTempLbl.text = forecast.lowTemp
        self.weatherImg.image = UIImage(named: forecast.weatherType)
    }
    

}
