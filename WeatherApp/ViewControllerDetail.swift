//
//  ViewControllerDetail.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var city:City?
    var weatherData:WeatherData?
    var extraInfosTable:[[ExtraInfo]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.isHidden = true

        print("\(city?.name ?? "no city") is passed")
        
        if let unwrapCity = city {
            RequestApi.getByCity(city: unwrapCity, Success: { (Data) in
                print(Data)
                let decoder = JSONDecoder()
                self.weatherData = try? decoder.decode(WeatherData.self, from: Data)
                print(self.weatherData?.daily.data[0].time ?? "error")
                
                self.extraInfosTable = [
                    [
                        ExtraInfo(value: Int((self.weatherData?.currently.humidity ?? 0) * 100), unity: .humidity),
                        ExtraInfo(value: Int((self.weatherData?.currently.windSpeed ?? 0) * 3.6), unity: .windSpeed)
                    ],
                    [
                        ExtraInfo(value: Int((self.weatherData?.currently.pressure ?? 0)), unity: .atmoPressure),
                        ExtraInfo(value: Int((self.weatherData?.currently.uvIndex ?? 0)), unity: .uvIndex)
                    ]
                ]
                
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }) { (Error) in
                print(Error)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return weatherData?.hourly.data.count ?? 0
        case 3:
            return 1
        case 4:
            return weatherData?.daily.data.count ?? 0
        case 5:
            return 1
        case 6:
            return extraInfosTable?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCellIdentifier", for: indexPath) as? HeaderCell {
                if let currently = weatherData?.currently {
                    cell.configure(withCurrently: currently)
                    //print("cell configure call")
                    return cell
                }
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTextCellIdentifier", for: indexPath) as? ForecastTextCell {
                if let summary = weatherData?.hourly.summary {
                    cell.configure(withForecastText: summary)
                    //print("cell configure call")
                    return cell
                }
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyForecastCellIdentifier", for: indexPath) as? HourlyForecastCell {
                if let data = weatherData?.hourly.data[indexPath.row], let timezone = weatherData?.timezone {
                    cell.configure(withHourlyData: data, withTimeZone: timezone)
                    //print("cell configure call")
                    return cell
                }
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTextCellIdentifier", for: indexPath) as? ForecastTextCell {
                if let summary = weatherData?.daily.summary {
                    cell.configure(withForecastText: summary)
                    //print("cell configure call")
                    return cell
                }
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DailyForecastCellIdentifier", for: indexPath) as? DailyForecastCell {
                if let data = weatherData?.daily.data[indexPath.row] {
                    cell.configure(withDailyData: data)
                    //print("cell configure call")
                    return cell
                }
            }
        case 5:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTextCellIdentifier", for: indexPath) as? ForecastTextCell {
                cell.configure(withForecastText: "Extra Information")
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInfoCellIdentifier", for: indexPath) as? ExtraInfoCell {
                if let extraInfos = extraInfosTable?[indexPath.row] {
                    cell.configure(withExtraInfo: extraInfos)
                    return cell
                }
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
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
