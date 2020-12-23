//
//  LocationManager.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import CoreLocation

final class LocationManager: NSObject {
    
    private let locationManager = CLLocationManager()
    static let shared = LocationManager()
    var currentLocation: CLLocation?
    
    var locationCallBack: ((CLLocation) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

// MARK: CLLocationManagerDelegate
extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if let location = locations.first {
            currentLocation = location
            locationCallBack?(location)
        }
  
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let sdsd = ""
    }
    
}
