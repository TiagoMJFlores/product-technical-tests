//
//  BoutiqueItemPresenterProtocol.swift
//  SampleApp
//
//  Created by Tiago Flores on 24/12/2020.
//

import Foundation

protocol BotiqueItemDelegate {
    func viewLayerLoaded()
    func didSelectItem(at indexPath: IndexPath)
}

protocol BotiqueItemDataSource {
    
    var name: String { get }
    var description: String { get}
    var imageUrl: String? { get }
    func getAddress(completionHandler: @escaping (_ result: String) -> ())
   
    func item(at indexPath: IndexPath) -> BoutiqueItemCell
    func numberOfItems() -> Int
}
