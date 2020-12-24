//
//  BoutiqueItemTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 24/12/2020.
//

import UIKit

class BoutiqueItemTableViewCell: BoutiqueTableViewCell {

    private var presenter: BoutiqueItemPresenterProtocol?
    
    func configure(with presenter: BoutiqueItemPresenterProtocol, type: BoutiqueItemCell) {
        self.presenter = presenter
        titleTextLabel.text = "Hello"
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
