//
//  ViewController.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMap: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mapViewRef:MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var citySelected:City?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        self.tableView.isHidden = true
        //mapView.delegate = self as? MKMapViewDelegate
        //self.tableView.reloadData()
        
        for city in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            mapViewRef.addAnnotation(pin)
        }
    }
    
    @IBAction func menuClicked(sender: UIBarButtonItem) {
        tableView.isHidden.toggle()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        citySelected = CitiesData.list[indexPath.row]
        print(citySelected?.name ?? "error")
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.isHidden = true
        
        self.performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CitiesData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesCellIdentifier", for: indexPath) as? CitiesCell {
            let city = CitiesData.list[indexPath.row]
            cell.configure(withCitiesName: city.name)
            return cell
        }
        return UITableViewCell()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("pin selected")
        
        for city in CitiesData.list {
            if (city.name == view.annotation?.title) {
                citySelected = city
                print("\(city.name) stored")
            }
        }
        
        self.performSegue(withIdentifier: "toDetailPage", sender: nil)
        
        //let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerDetail") as! ViewControllerDetail
        //self.navigationController?.pushViewController(nextViewController, animated: true)
        mapViewRef.deselectAnnotation(view.annotation, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue call")
        if let viewControllerDetail = segue.destination as? ViewControllerDetail, let city:City = citySelected {
            viewControllerDetail.city = city
            print("send city")
        }
    }
}

