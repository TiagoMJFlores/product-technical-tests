//
//  MapLocationViewReceiver.swift
//  SampleApp
//
//  Created by Tiago Flores on 26/12/2020.
//

import Foundation

protocol MapLocationViewReceiver: class {
    
    func addLocation(mapAnnotation: MapAnnotation)
}
