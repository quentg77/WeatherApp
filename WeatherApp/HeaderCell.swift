//
//  HeaderCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    func configure(withCurrently currently: Currently) {
        weatherImage.image = UIImage(named: "\(currently.icon).png")
        temperatureLabel.text = "\(lroundf(currently.temperature)) °C"
        weatherLabel.text = currently.summary
    }
}
