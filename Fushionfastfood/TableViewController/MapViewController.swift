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
    
    
    let regionRadius: CLLocationDistance = 5000
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
        Gotostall()
//        functions
        
//        locationdelegate
        
        //formatting the lat and long
            locationManager.delegate = locationDelegate
            locationDelegate.locationCallback = { location in
                self.latestLocation = location
                self.centerMapOnLocation(location: location)
                //self.mapView.showsUserLocation = true
                
        }
        
    }
    func Gotostall()
    {
        let a1 = MKPointAnnotation()
//        a1
        a1.coordinate = CLLocationCoordinate2D(latitude: 1.343410, longitude: 103.775440)
        a1.title = "Fushion Fast Food"
        a1.subtitle = "Bukit Timah"
        self.mapView.addAnnotation(a1)
        
        
        let a2 = MKPointAnnotation()
        a2.coordinate = CLLocationCoordinate2D(latitude: 1.314560, longitude: 103.765250)
        a2.title = "Fushion Fast Food 2"
        a2.subtitle = "Bukit Timah"
        self.mapView.addAnnotation(a2)
        
        
    }
        
}

