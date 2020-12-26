//
//  MapLocationPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import Foundation
import MapKit

final class MapLocationPresenter {
    
    let mapItemInFocus: MapItem
    let secondaryMapItems: [MapItem]
    weak var view: MapLocationViewReceiver?
    
    init(mapItemInFocus: MapItem, secondaryMapItems: [MapItem]) {
        self.mapItemInFocus = mapItemInFocus
        self.secondaryMapItems = secondaryMapItems
    }
}

// MARK: MapLocationDelegate
extension MapLocationPresenter: MapLocationDelegate {
    
    func viewLayerLoaded() {
        let mapAnnotation = MapAnnotation(id: mapItemInFocus.id)
        let pinLocation = CLLocationCoordinate2D(latitude: mapItemInFocus.location.lat, longitude: mapItemInFocus.location.lon)
        mapAnnotation.coordinate = pinLocation
        view?.addLocation(mapAnnotation: mapAnnotation)
    }
    
}
