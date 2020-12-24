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
            configureLocationCellType()
            break
        case .directions:
            configureDirectionCellType()
            break
        }
    }
    
    private func configureLocationCellType() {
        botiqueImageView.isHidden = false
        botiqueImageView.image = UIImage(named: "location1")
        let location = presenter
        // add geo location
        titleTextLabel.text = "GeoLocation"
    }
    
    private func configureDirectionCellType() {
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
