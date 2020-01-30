//
//  MapViewController.swift
//  Fushionfastfood
//
//  Created by Fabian on 23/1/20.
//  Copyright © 2020 Fabian Jow. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
   
    // call the locationdelegate
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager: CLLocationManager = {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.startUpdatingLocation()
    $0.startUpdatingHeading()
    return $0
    }(CLLocationManager())
    
    
    let regionRadius: CLLocationDistance = 250
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion (
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        functions
        
        
//        locationdelegate
        
        //formatting the lat and long
            locationManager.delegate = locationDelegate
            locationDelegate.locationCallback = { location in
                self.latestLocation = location
                self.centerMapOnLocation(location: location)
            
                let annotation:MKPointAnnotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = "Me!"
                self.mapView.addAnnotation(annotation)
                    
                //self.mapView.showsUserLocation = true
            
        }
        func gotostall()
        {
            
        }
        
    }
}
