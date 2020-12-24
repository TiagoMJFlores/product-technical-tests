//
//  BoutiqueListPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation
import Alamofire
import CoreLocation

typealias BoutiqueListPresenterProtocol = BotiqueListDelegate & BotiqueListDataSource

final class BoutiqueListPresenter {
    private var items: [MapItem] = []
    private let boutiqueListService: BoutiqueListServiceProtocol
    private let coordinator: BoutiqueListCoordinator

    weak var view: BoutiqueListViewReceiver?

    init(boutiqueListService: BoutiqueListServiceProtocol = BoutiqueListService(), coordinator: BoutiqueListCoordinator) {
        self.boutiqueListService = boutiqueListService
        self.coordinator = coordinator
    }
}

//MARK: BotiqueListDataSource
extension BoutiqueListPresenter: BotiqueListDataSource {
    
    func item(at indexPath: IndexPath) -> BoutiqueItemPresenter? {
        let item = self.items[indexPath.row]
        let itemPresenter = BoutiqueItemPresenter(item: item)
        return itemPresenter
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
}

//MARK: BotiqueListDelegate
extension BoutiqueListPresenter: BotiqueListDelegate {
    
    func viewLayerLoaded() {
        
        LocationManager.shared.locationCallBack = { [weak self] currentLocation, status in
            guard let self = self else { return }
            
            switch status {
                case .authorizedWhenInUse, .authorizedAlways:
                    self.boutiqueListService.doRequest(completionHandler: { [weak self] data in
                        guard let self = self,  let  currentLocation = currentLocation else { return }
                        self.items = self.getFiveCloserItems(currentLocation: currentLocation, data: data)
                        self.view?.reloadData()
                    })
                    
                break
          
            case .restricted:
                self.showErrorLocationMessageInView()
                break
            case .denied:
                self.showErrorLocationMessageInView()
                break
            case .notDetermined:
                break
            @unknown default:
                break
            }
        
        }
    }
    

    func getFiveCloserItems(currentLocation: CLLocation ,data: [MapItem]) -> [MapItem] {
        var data = data
        data.sort { elementOne, elementTwo in
            let boutiqueLocationOne = CLLocation(latitude: elementOne.location.lat, longitude: elementOne.location.lon)
            let boutiqueLocationTwo = CLLocation(latitude: elementTwo.location.lat, longitude: elementTwo.location.lon)
          
            let distanceToElementOne  = currentLocation.distance(from: boutiqueLocationOne)
            let distanceToElementTwo  = currentLocation.distance(from: boutiqueLocationTwo)
            return distanceToElementOne < distanceToElementTwo
            
        }
        return Array(data.prefix(5))
    }
    
    private func showErrorLocationMessageInView() {
        view?.showErrorMessage(text: LocationStrings.errorLocationMessage)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        let itemPresenter = BoutiqueItemPresenter(item: item)
        coordinator.showPhotoDetail(presenter: itemPresenter)
    }
    
}
