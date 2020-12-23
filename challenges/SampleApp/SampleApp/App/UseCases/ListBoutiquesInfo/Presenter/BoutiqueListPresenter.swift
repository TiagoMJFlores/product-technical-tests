//
//  BoutiqueListPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

typealias BoutiqueListPresenterProtocol = BotiqueListDelegate & BotiqueListDataSource

struct BoutiqueListPresenter {
 
  
}

//MARK: BotiqueListDataSource
extension BoutiqueListPresenter: BotiqueListDataSource {
    
    func item(at indexPath: IndexPath) -> BoutiqueItemPresenter? {
        return BoutiqueItemPresenter()
    }
    
    func numberOfItems() -> Int {
        return 5
    }
    
}

//MARK: BotiqueListDelegate
extension BoutiqueListPresenter: BotiqueListDelegate {
    
    func viewLayerLoaded() {
        
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}
