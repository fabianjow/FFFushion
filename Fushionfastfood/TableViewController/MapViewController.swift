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
    
    
    let regionRadius: CLLocationDistance = 2000
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
        a1.subtitle = "Ngee Ann Poly"
        self.mapView.addAnnotation(a1)
        
        
        let a2 = MKPointAnnotation()
        a2.coordinate = CLLocationCoordinate2D(latitude: 1.314560, longitude: 103.765250)
        a2.title = "Fushion Fast Food "
        a2.subtitle = "Bukit Timah"
        self.mapView.addAnnotation(a2)
        
        let a3 = MKPointAnnotation()
        a3.coordinate = CLLocationCoordinate2D(latitude: 1.2830, longitude: 103.8579)
        a3.title = "Fushion Fast Food "
        a3.subtitle = "Marina Bay"
        self.mapView.addAnnotation(a3)
        
        let a4 = MKPointAnnotation()
        a4.coordinate = CLLocationCoordinate2D(latitude: 1.4360, longitude: 103.7860)
        a4.title = "Fushion Fast Food "
        a4.subtitle = "CauseWay Point"
        self.mapView.addAnnotation(a4)
        
        let a5 = MKPointAnnotation()
        a5.coordinate = CLLocationCoordinate2D(latitude: 1.4067, longitude: 103.9022)
        a5.title = "Fushion Fast Food "
        a5.subtitle = "Waterway Point"
        self.mapView.addAnnotation(a5)
        
        let a6 = MKPointAnnotation()
        a6.coordinate = CLLocationCoordinate2D(latitude: 1.4280, longitude: 103.8364)
        a6.title = "Fushion Fast Food "
        a6.subtitle = "Northpoint"
        self.mapView.addAnnotation(a6)
     
        let a7 = MKPointAnnotation()
        a7.coordinate = CLLocationCoordinate2D(latitude: 1.3346, longitude: 103.9624)
        a7.title = "Fushion Fast Food "
        a7.subtitle = "Changi City Point"
        self.mapView.addAnnotation(a7)
        
        let a8 = MKPointAnnotation()
        a8.coordinate = CLLocationCoordinate2D(latitude: 1.3249, longitude: 103.9324)
        a8.title = "Fushion Fast Food "
        a8.subtitle = "Bedok Point"
        self.mapView.addAnnotation(a8)
        
        let a9 = MKPointAnnotation()
        a9.coordinate = CLLocationCoordinate2D(latitude: 1.3396, longitude: 103.7058)
        a9.title = "Fushion Fast Food "
        a9.subtitle = "Jurong Point"
        self.mapView.addAnnotation(a9)
        
        let aa = MKPointAnnotation()
        aa.coordinate = CLLocationCoordinate2D(latitude: 1.3507, longitude: 103.8488)
        aa.title = "Fushion Fast Food "
        aa.subtitle = "Junction 8"
        self.mapView.addAnnotation(aa)
        
        let a11 = MKPointAnnotation()
        a11.coordinate = CLLocationCoordinate2D(latitude: 1.3002, longitude: 103.8452)
        a11.title = "Fushion Fast Food "
        a11.subtitle = "Plaza Singapore "
        self.mapView.addAnnotation(a11)
        
        let a12 = MKPointAnnotation()
        a12.coordinate = CLLocationCoordinate2D(latitude: 1.3320, longitude: 103.8543)
        a12.title = "Fushion Fast Food "
        a12.subtitle = "Toa payoh Dragon"
        self.mapView.addAnnotation(a12)
        
        let a13 = MKPointAnnotation()
        a13.coordinate = CLLocationCoordinate2D(latitude: 1.3766, longitude: 103.8181)
        a13.title = "Fushion Fast Food "
        a13.subtitle = "Ang Mo Kio Hub"
        self.mapView.addAnnotation(a13)
        
        let a14 = MKPointAnnotation()
        a14.coordinate = CLLocationCoordinate2D(latitude: 1.3040, longitude: 103.8320)
        a14.title = "Fushion Fast Food "
        a14.subtitle = "ION Orchard"
        self.mapView.addAnnotation(a14)
        
        
    }
        
}

