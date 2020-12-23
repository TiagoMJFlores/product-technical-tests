//
//  BoutiqueTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit

class BoutiqueTableViewCell: UITableViewCell {

    private var presenter: BoutiqueItemPresenter?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with cellPresenter: BoutiqueItemPresenter) {
        presenter = cellPresenter
        self.textLabel?.text = cellPresenter.name
    }
}
