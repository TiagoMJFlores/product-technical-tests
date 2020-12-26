//
//  MapAnnotation.swift
//  SampleApp
//
//  Created by Tiago Flores on 26/12/2020.
//

import MapKit

class MapAnnotation: MKPointAnnotation {
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
    
    static func ==(lhs: MapAnnotation, rhs: MapAnnotation) -> Bool {
        return lhs.id == rhs.id
    }
}

