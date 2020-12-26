//
//  MapLocationPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import Foundation
import MapKit


typealias MapItemPresenterProtocol = MapLocationDelegate & MapLocationDataSource


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
        let mapAnnotation =  makeMapAnnotation(from: mapItemInFocus)
        view?.addLocation(mapAnnotation: mapAnnotation)
        let secondaryMapAnnotations: [MapAnnotation] = secondaryMapItems.map { item in
            let mapAnnotation =  makeMapAnnotation(from: item)
            return mapAnnotation
        }
        view?.addLocations(mapAnnotations: secondaryMapAnnotations)
    }
    
    private func makeMapAnnotation(from mapItem: MapItem) -> MapAnnotation {
        let mapAnnotation = MapAnnotation(id: mapItem.id)
        mapAnnotation.title = mapItem.name
        let pinLocation = CLLocationCoordinate2D(latitude: mapItem.location.lat, longitude: mapItem.location.lon)
        mapAnnotation.coordinate = pinLocation
        return mapAnnotation
    }
    
}

// MARK: MapLocationDelegate
extension MapLocationPresenter:  MapLocationDataSource {
    
    var mapItemInFocusId: String {
        mapItemInFocus.id
    }
    
}
