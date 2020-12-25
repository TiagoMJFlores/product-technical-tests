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
    
    var listenLocationChanges: ((CLLocation?, CLAuthorizationStatus) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestLocation()
    }
}

// MARK: CLLocationManagerDelegate
extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        if let location = locations.first {
            currentLocation = location
            listenLocationChanges?(location, .authorizedWhenInUse)
        }
  
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            // If status has not yet been determied, ask for authorization
            manager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            // If authorized when in use
            manager.startUpdatingLocation()
            break
        case .authorizedAlways:
 
            manager.startUpdatingLocation()
            break
        case .restricted:
            listenLocationChanges?(nil, .restricted)
            break
        case .denied:
            listenLocationChanges?(nil, .denied)
            break
        default:
            break
        }
    }
    
    func askPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getAuthorizationStatus() -> CLAuthorizationStatus  {
        if #available(iOS 14.0, *) {
            return locationManager.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
            // Fallback on earlier versions
        }
    }
    
   
}
