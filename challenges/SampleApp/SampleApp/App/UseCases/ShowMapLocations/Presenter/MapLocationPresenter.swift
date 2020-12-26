//
//  MapLocationPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import Foundation

final class MapLocationPresenter {
    
    let initialLocation: Location
    weak var view: MapLocationViewReceiver?
    
    init(initialLocation: Location) {
        self.initialLocation = initialLocation
    }
}

// MARK: MapLocationDelegate
extension MapLocationPresenter: MapLocationDelegate {
    
    func viewLayerLoaded() {
        view?.addLocation(location: initialLocation)
    }
    
}
