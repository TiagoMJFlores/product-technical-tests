//
//  BotiqueListProtocol.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit

protocol BotiqueListDelegate {
    func viewLayerLoaded()
    func didSelectItem(at indexPath: IndexPath)
}

protocol BotiqueListDataSource {
    func pressedGoToSettings()
    func item(at indexPath: IndexPath) -> BoutiqueItemPresenter?
    func numberOfItems() -> Int
}
