//
//  LocationMath.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import CoreLocation

protocol LocationMathProtocol {
    func getAddressFromLatLon(lat: Double, lon: Double, completionHandler: @escaping (_ result: String) -> ())
}

struct LocationMath: LocationMathProtocol {
    
    func getAddressFromLatLon(lat: Double, lon: Double, completionHandler: @escaping (_ result: String) -> ())  {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                    //completionHandler("Unknown")
                } else {
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0] 
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }

                        completionHandler(addressString)
                        print(addressString)
                    }

                }
        })

    }

}
