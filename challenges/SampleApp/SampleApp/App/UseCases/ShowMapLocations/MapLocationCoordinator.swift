//
//  MapLocationCoordinator.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit

final class MapLocationCoordinator {
    
    private let navigationController: UINavigationController
    private let location: Location

    init(navigationController: UINavigationController, location: Location) {
        self.navigationController = navigationController
        self.location = location
    }
    
    func start() {
        let presenter = MapLocationPresenter(initialLocation: location)
        let initialViewController = MapLocationViewController(presenter: presenter)
        presenter.view = initialViewController
        self.navigationController.pushViewController(initialViewController, animated: true)
    }
    
}
