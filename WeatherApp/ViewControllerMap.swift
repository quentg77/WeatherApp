//
//  ViewController.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMap: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapViewRef:MKMapView!
    
    var citySelected:City?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView.delegate = self as? MKMapViewDelegate
        
        for city in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = city.coordinates
            pin.title = city.name
            mapViewRef.addAnnotation(pin)
        }
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

