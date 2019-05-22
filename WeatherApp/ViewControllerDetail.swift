//
//  ViewControllerDetail.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {

    var city:City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(city?.name ?? "no city") is passed")
        
        if let unwrapCity = city {
            RequestApi.getByCity(city: unwrapCity, Success: { (Data) in
                print(Data)
            }) { (Error) in
                print(Error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
