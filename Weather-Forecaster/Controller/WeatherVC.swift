//
//  WeatherVC.swift
//  Weather-Forecaster
//
//  Created by Hayden Jamieson on 05/02/2018.
//  Copyright © 2018 Hayden Jamieson. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global(qos: .background).async {
            DataService.instance.downloadWeatherDetails { (success) in
                DataService.instance.downloadForecastData { (success) in
                    DispatchQueue.main.async {
                        self.updateMainUI()
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func updateMainUI() {
        let weatherObj = DataService.instance.weatherArray[0]
        dateLbl.text = weatherObj.date
        temperatureLbl.text = "\(weatherObj.currentTemp)"
        weatherType.text = weatherObj.weatherType
        locationLbl.text = weatherObj.cityName
        imgView.image = UIImage(named: weatherObj.weatherType)
    }
    
    
}

extension WeatherVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else {return UITableViewCell()}
        cell.configureCell(withForecastObject: DataService.instance.forecasts[indexPath.row])
        return cell
    }
}

