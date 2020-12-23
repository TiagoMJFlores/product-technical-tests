//
//  BoutiqueListPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation
import Alamofire

typealias BoutiqueListPresenterProtocol = BotiqueListDelegate & BotiqueListDataSource

final class BoutiqueListPresenter {
    private var items: [MapItem] = []
    private let boutiqueListService: BoutiqueListServiceProtocol
    weak var view: BoutiqueListViewReceiver?

    init(boutiqueListService: BoutiqueListServiceProtocol = BoutiqueListService()) {
        self.boutiqueListService = boutiqueListService
      
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
        
        LocationManager.shared.locationCallBack = { [weak self] location, status in
            guard let self = self else { return }
            
            switch status {
                case .authorizedWhenInUse, .authorizedAlways:
                    self.boutiqueListService.doRequest(completionHandler: { data in
                        self.items = data
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
    
    private func showErrorLocationMessageInView() {
        view?.showErrorMessage(text: LocationStrings.errorLocationMessage)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}
