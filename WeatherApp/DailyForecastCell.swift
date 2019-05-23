//
//  DailyForecastCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 23/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class DailyForecastCell: UITableViewCell {

    @IBOutlet weak var dayLabel:UILabel!
    @IBOutlet weak var imageWeather:UIImageView!
    @IBOutlet weak var maxLabel:UILabel!
    @IBOutlet weak var minLabel:UILabel!
    
    func configure(withDailyData dailyData:Daily.Data) {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyData.time))
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        let strDate = dateFormater.string(from: date)
        
        dayLabel.text = strDate
        imageWeather.image = UIImage(named: "\(dailyData.icon).png")
        maxLabel.text = "\(lroundf(dailyData.temperatureHigh)) °C"
        minLabel.text = "\(lroundf(dailyData.temperatureLow)) °C"
    }
}
