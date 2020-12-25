//
//  MapLocationCoordinator.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit

final class MapLocationCoordinator {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = MapLocationPresenter()
        let initialViewController = MapLocationViewController(presenter: presenter)
        self.navigationController.pushViewController(initialViewController, animated: true)
    }
    
}
