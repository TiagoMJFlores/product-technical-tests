//
//  BoutiqueItemPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

typealias BoutiqueItemPresenterProtocol = BotiqueItemDelegate & BotiqueItemDataSource


enum BoutiqueItemCell: Int, CaseIterable {
    case description,
         mapLocation,
        directions
}


final class BoutiqueItemPresenter {
    private let item: MapItem
    private let locationMath: LocationMathProtocol
    private let mapCoordinator: MapLocationCoordinator
    weak var view: BoutiqueItemViewReceiver?
    
    init(item: MapItem, locationMath: LocationMathProtocol = LocationMath(), coordinator: MapLocationCoordinator) {
        self.mapCoordinator = coordinator
        self.locationMath = locationMath
        self.item = item
    }
}

//MARK: BotiqueItemDelegate
extension BoutiqueItemPresenter: BotiqueItemDelegate {
    
    func viewLayerLoaded() {
        view?.reloadData()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
        switch indexPath.row {
        case BoutiqueItemCell.mapLocation.rawValue:
            mapCoordinator.start()
            break
        case BoutiqueItemCell.directions.rawValue:
            break
        default:
            break
        }
    }
    
}

//MARK: BotiqueItemDataSource
extension BoutiqueItemPresenter: BotiqueItemDataSource {
    
    func getAddress(completionHandler: @escaping (String) -> ()) {
        
        locationMath.getAddressFromLatLon(lat: item.location.lat, lon:  item.location.lon) { location in
            completionHandler(location)
        }
    }
    
    
    var name: String {
        return item.name
    }
    
    var description: String {
        return item.welcomeDescription
    }
    
    var imageUrl: String? {
        return item.logo?.url
    }
    
    
    func item(at indexPath: IndexPath) -> BoutiqueItemCell {
        return  BoutiqueItemCell.allCases[indexPath.row]
    }
    
    func numberOfItems() -> Int {
        BoutiqueItemCell.allCases.count
    }
    
    
}
