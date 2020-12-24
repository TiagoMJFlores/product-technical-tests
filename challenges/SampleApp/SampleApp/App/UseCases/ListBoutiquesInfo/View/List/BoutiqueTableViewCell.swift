//
//  BoutiqueTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit
import Kingfisher

class BoutiqueTableViewCell: BoutiqueBaseTableViewCell {

    private var presenter: BoutiqueItemPresenterProtocol?
    
    func configure(with cellPresenter: BoutiqueItemPresenter) {
        presenter = cellPresenter
        botiqueImageView.isHidden = false
        if let imageUrl = cellPresenter.imageUrl  {
            downloadImage(from: imageUrl)
        } else {
            botiqueImageView.isHidden = true
        }
    
        titleTextLabel .text = cellPresenter.name
    }
    
    private func downloadImage(from imageUrl: String) {
        
        let url = URL(string: imageUrl)
        self.botiqueImageView.kf.setImage(with: url,
                                          placeholder: UIImage(named: "placeholder"),
                                          options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
                                          ])
        
    }
    
    
  
}
