//
//  BoutiqueBaseTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 24/12/2020.
//

import UIKit

class BoutiqueBaseTableViewCell: UITableViewCell {

    private (set) lazy var titleTextLabel: UILabel = {
        let titleTextLabel = UILabel()
        titleTextLabel.text = "Hello"
        titleTextLabel.textColor = UIColor.black
        return titleTextLabel
    }()
    

    private (set) lazy var botiqueImageView: UIImageView = {
        let botiqueImageView = UIImageView()
        botiqueImageView.layer.cornerRadius = botiqueImageView.frame.width / 2
        botiqueImageView.clipsToBounds = true
        botiqueImageView.contentMode = .scaleAspectFit
        botiqueImageView.backgroundColor = .white
        return botiqueImageView
    }()
    
   
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        let spacerView = UIView()
      
        stackView.axis  = .horizontal
        stackView.distribution  = .fillProportionally
        stackView.alignment = .top
        stackView.spacing   = 8
       
        stackView.addArrangedSubview(botiqueImageView)
        stackView.addArrangedSubview(titleTextLabel)
        contentView.addSubview(stackView)
        return stackView
    }()
        

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureViews(){
        self.accessoryType = .disclosureIndicator
        backgroundColor = .white
        configureLayout()
    }
    

    private func configureLayout() {
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
        ])
        
        titleTextLabel.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor).isActive = true
        botiqueImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            botiqueImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
        
    }
}
