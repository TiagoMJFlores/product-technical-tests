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
    
    var locationCallBack: ((CLLocation?, CLAuthorizationStatus) -> Void)?
    
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
            locationCallBack?(location, .authorizedWhenInUse)
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
            locationCallBack?(nil, .restricted)
            break
        case .denied:
            locationCallBack?(nil, .denied)
            break
        default:
            break
        }
    }
}
