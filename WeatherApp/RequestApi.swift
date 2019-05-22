//
//  RequestApi.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import Foundation
import Alamofire

class RequestApi {
    static func getByCity (city:City, Success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        let encodedUrl = "https://api.darksky.net/forecast/c8488fbe77768f7fef14cfeadb098643/\(city.coordinates.latitude),\(city.coordinates.longitude)?lang=fr&units=si".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(encodedUrl!)
        
        Alamofire.request(encodedUrl ?? "").responseData(completionHandler: { (DataResponse) in
            switch DataResponse.result {
            case .success(let value):
                print("success")
                Success(value)
            case .failure(let error):
                print("error")
                failure(error)
            }
        })
    }
}
