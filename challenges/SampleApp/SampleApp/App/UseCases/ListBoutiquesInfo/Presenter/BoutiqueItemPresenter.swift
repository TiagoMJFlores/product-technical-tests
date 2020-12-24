//
//  BoutiqueItemPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

typealias BoutiqueItemPresenterProtocol = BotiqueItemDelegate & BotiqueItemDataSource


enum BoutiqueItemCell: CaseIterable {
    case description,
         mapLocation,
        directions
}

final class BoutiqueItemPresenter {
    private let item: MapItem
    weak var view: BoutiqueItemViewReceiver?
    
    var name: String {
        return item.name
    }
    
    var description: String {
        return item.welcomeDescription
    }
    
    var imageUrl: String? {
        return item.logo?.url
    }
    init(item: MapItem) {
        self.item = item
    }
}

//MARK: BotiqueItemDelegate
extension BoutiqueItemPresenter: BotiqueItemDelegate {
    
    func viewLayerLoaded() {
    
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}

//MARK: BotiqueItemDataSource
extension BoutiqueItemPresenter: BotiqueItemDataSource {
    
    func item(at indexPath: IndexPath) -> BoutiqueItemCell {
        return BoutiqueItemCell.mapLocation
    }
    
    func numberOfItems() -> Int {
        BoutiqueItemCell.allCases.count
    }
    
    
}
