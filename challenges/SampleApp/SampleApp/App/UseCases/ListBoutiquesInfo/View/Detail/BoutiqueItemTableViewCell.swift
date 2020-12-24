//
//  BoutiqueItemTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 24/12/2020.
//

import UIKit

class BoutiqueItemTableViewCell: BoutiqueBaseTableViewCell {

    private var presenter: BoutiqueItemPresenterProtocol?
    
    func configure(with presenter: BoutiqueItemPresenterProtocol, type: BoutiqueItemCell) {
        self.presenter = presenter
        
        NSLayoutConstraint.activate([
            botiqueImageView.widthAnchor.constraint(equalToConstant: 24),
        ])
        
        horizontalStackView.alignment = .center
        switch type {
        
        case .description:
            titleTextLabel.text = presenter.description
            break
        case .mapLocation:
            configureLocationCellType(with:presenter)
            break
        case .directions:
            configureDirectionCellType(with:presenter)
            break
        }
    }
    
    private func configureLocationCellType(with presenter: BoutiqueItemPresenterProtocol) {
        botiqueImageView.isHidden = false
        botiqueImageView.image = UIImage(named: "location1")
     
        presenter.getAddress() { [weak self] address in
            guard let self = self else {
                return
            }
            
            self.titleTextLabel.text = address
        }
       
    }
    
    private func configureDirectionCellType(with presenter: BoutiqueItemPresenterProtocol) {
        botiqueImageView.isHidden = false
        botiqueImageView.image = UIImage(named: "direction")
        titleTextLabel.text = "Directions"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
