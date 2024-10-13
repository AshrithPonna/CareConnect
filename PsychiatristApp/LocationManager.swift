//
// LocationManager.swift
// PsychProj
//
// Created by Ashrith Ponna on 9/21/24
//

//Importing library necessary for location management.

import CoreLocation

//Location initializer for admins (based on user location).

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var location: CLLocation?
    
    //Updating locations at applicative intervals.
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    //Saving locations and integrating data into the app.
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
    
    //Getting location information from users of the application.
    
    func requestLocation() {
        locationManager.requestLocation()
    }
}
