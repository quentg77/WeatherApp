//
//  ForecastTextCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 23/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class ForecastTextCell: UITableViewCell {

    @IBOutlet weak var forecastTextLabel: UILabel!

    func configure(withForecastText forcastText:String) {
        forecastTextLabel.text = forcastText
    }
}
