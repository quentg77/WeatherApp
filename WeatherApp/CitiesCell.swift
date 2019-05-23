//
//  CitiesCell.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 23/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class CitiesCell: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!

    func configure(withCitiesName name:String) {
        nameLabel.text = name
    }
}
