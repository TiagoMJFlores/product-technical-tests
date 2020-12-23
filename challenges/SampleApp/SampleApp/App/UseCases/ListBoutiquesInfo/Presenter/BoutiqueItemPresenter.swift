//
//  BoutiqueItemPresenter.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

struct BoutiqueItemPresenter {
    private let item: MapItem
    
    var name: String {
        return item.name
    }
    
    var imageUrl: String? {
        return item.logo?.url
    }
    
    init(item: MapItem) {
        self.item = item
    }
}
