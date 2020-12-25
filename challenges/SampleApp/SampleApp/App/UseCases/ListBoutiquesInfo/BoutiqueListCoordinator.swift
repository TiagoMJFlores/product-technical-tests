//
//  BoutiqueListCoordinator.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit


final class BoutiqueListCoordinator {
    
    private (set) var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let presenter = BoutiqueListPresenter(coordinator: self)
        let initialViewController = BoutiqueListViewController(presenter: presenter)
        self.navigationController.pushViewController(initialViewController, animated: true)
    }
    
    func showPhotoDetail(presenter: BoutiqueItemPresenter) {
        let photoDetail = BoutiqueItemViewController(presenter: presenter)
        presenter.view = photoDetail
        self.navigationController.pushViewController(photoDetail, animated: true)
    }
}
