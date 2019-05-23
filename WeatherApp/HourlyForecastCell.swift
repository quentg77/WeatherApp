//
//  HourlyForecastCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 23/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class HourlyForecastCell: UITableViewCell {

    @IBOutlet weak var houreLabel:UILabel!
    @IBOutlet weak var imageWeather:UIImageView!
    @IBOutlet weak var humidityLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    func configure(withHourlyData hourlyData:Hourly.Data) {
        let date = Date(timeIntervalSince1970: TimeInterval(hourlyData.time))
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH"
        let strDate = dateFormater.string(from: date)
        
        let humidity = String(lroundf(hourlyData.humidity * 100))
        
        houreLabel.text = strDate + "h"
        imageWeather.image = UIImage(named: "\(hourlyData.icon).png")
        humidityLabel.text = humidity + "%"
        temperatureLabel.text = "\(lroundf(hourlyData.temperature)) °C"
    }
}
