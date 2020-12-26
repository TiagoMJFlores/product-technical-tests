//
//  MapDirectionsProcessor.swift
//  SampleApp
//
//  Created by Tiago Flores on 26/12/2020.
//

import CoreLocation
import UIKit
import MapKit

protocol MapDirectionsProcessorProtocol {
    func showDirections(location: CLLocationCoordinate2D, userCoord: CLLocation)
}

struct MapDirectionsProcessor: MapDirectionsProcessorProtocol {
    
    func showDirections(location: CLLocationCoordinate2D, userCoord: CLLocation) {
        let isMovitInstaled = UIApplication.shared.canOpenURL(URL(string: "moovit://")!)
        let isGoogleMapsInstaled =  UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)
        if isMovitInstaled {
            showMoovit(location: location, currentCoord: userCoord)
        }
        else if (isGoogleMapsInstaled) {
            showGoogleMaps(location: location, userCoord: userCoord)
        } else {
            showAppleMaps(location: location)
        }
    }
    
    
    private func showMoovit(location: CLLocationCoordinate2D, currentCoord: CLLocation)  {
        let str = "moovit://directions?dest_lat=\(location.latitude)&dest_lon=\(location.longitude)&orig_lat=\(currentCoord.coordinate.latitude)&orig_lon=\(currentCoord.coordinate.longitude)"
        let openUrl = URL(string: str)!
        UIApplication.shared.open(openUrl, options: [:], completionHandler: { result in })
    }
    
    private func showGoogleMaps(location: CLLocationCoordinate2D, userCoord: CLLocation)  {
        let str = "comgooglemaps://?saddr=&daddr=\(userCoord.coordinate .latitude),\(userCoord.coordinate.longitude)&directionsmode=driving"
       let openUrl = URL(string: str)!
        UIApplication.shared.open(openUrl, options: [:], completionHandler: { result in })

    }
    
    private func showAppleMaps(location: CLLocationCoordinate2D) {
        let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
        
        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ]
        
        MKMapItem.openMaps(with: [MKMapItem.forCurrentLocation(), MKMapItem(placemark: placemark)], launchOptions: launchOptions)
        
    }
}
