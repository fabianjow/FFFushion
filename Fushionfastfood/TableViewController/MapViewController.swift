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
        //Geocoding & Annotations
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(
        "535 Clementi Road Singapore 310171",completionHandler: {p,e in
        let initialLocation = CLLocation(latitude: p![0].location!.coordinate.latitude, longitude: p![0].location!.coordinate.longitude)
        self.centerMapOnLocation(location: initialLocation)
        
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = "Fast Food Fusion"
        annotation.subtitle = "School of ICT"
        self.mapView.addAnnotation(annotation)
        })
        
        
    }
        
}

