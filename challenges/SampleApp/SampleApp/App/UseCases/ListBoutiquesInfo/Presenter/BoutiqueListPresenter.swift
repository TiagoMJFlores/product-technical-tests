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
    weak var view: BoutiqueListViewReceiver?

    
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
        
        LocationManager.shared.locationCallBack = { location in
            
        }
        
        AF.request(BotiqueAPIConfiguration()).validate(statusCode: 200..<299)
            .responseDecodable { [weak self] (response: AFDataResponse<[MapItem]>)  in
                guard let self = self else { return }
            
                switch response.result {
                case let .failure(error):
                            print(error)
                     
                default:
                    guard let data = response.value else { return }
                    self.items = data
                    self.view?.reloadData()
                    break
               
                }
        }
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        
    }
    
}
