//
//  MapLocationCoordinator.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit

final class MapLocationCoordinator {
    
    private let navigationController: UINavigationController
    private let mapItem: MapItem
    private let secondaryMapItems: [MapItem]
    
    init(navigationController: UINavigationController, mapItem: MapItem,  secondaryMapItems: [MapItem]) {
        self.secondaryMapItems = secondaryMapItems
        self.navigationController = navigationController
        self.mapItem = mapItem
    }
    
    func start() {
        let presenter = MapLocationPresenter(mapItemInFocus: mapItem, secondaryMapItems: secondaryMapItems)
        let initialViewController = MapLocationViewController(presenter: presenter)
        presenter.view = initialViewController
        self.navigationController.pushViewController(initialViewController, animated: true)
    }
    
}
