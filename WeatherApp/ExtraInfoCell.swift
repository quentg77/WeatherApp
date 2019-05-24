//
//  ExtraInfoCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 23/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class ExtraInfoCell: UITableViewCell {

    @IBOutlet weak var title1Label:UILabel!
    @IBOutlet weak var title2Label:UILabel!
    @IBOutlet weak var value1Label:UILabel!
    @IBOutlet weak var value2Label:UILabel!

    func configure(withExtraInfo extraInfos:[ExtraInfo]) {
        setTitleOf(titleLabel: title1Label, extraInfo: extraInfos[0])
        setTitleOf(titleLabel: title2Label, extraInfo: extraInfos[1])
        setValueOf(valueLabel: value1Label, extraInfo: extraInfos[0])
        setValueOf(valueLabel: value2Label, extraInfo: extraInfos[1])
    }
    
    private func setTitleOf(titleLabel:UILabel, extraInfo:ExtraInfo) {
        switch extraInfo.unity {
        case .humidity:
            titleLabel.text = "Humidity"
        case .atmoPressure:
            titleLabel.text = "Pressure"
        case .windSpeed:
            titleLabel.text = "Wind Speed"
        case .uvIndex:
            titleLabel.text = "UV Index"
        }
    }
    
    private func setValueOf(valueLabel:UILabel, extraInfo:ExtraInfo) {
        switch extraInfo.unity {
        case .humidity:
            valueLabel.text = String(extraInfo.value) + "%"
        case .atmoPressure:
            valueLabel.text = String(extraInfo.value) + " hPa"
        case .windSpeed:
            valueLabel.text = String(extraInfo.value) + " km/h"
        case .uvIndex:
            valueLabel.text = String(extraInfo.value)
        }
    }
}
