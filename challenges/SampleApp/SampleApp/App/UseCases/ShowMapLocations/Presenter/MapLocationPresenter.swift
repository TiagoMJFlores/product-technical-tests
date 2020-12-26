//
//  MapLocationPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import Foundation

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
        view?.addLocation(location: mapItemInFocus.location)
    }
    
}
