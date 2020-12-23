//
//  BoutiqueTableViewCell.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit
import Kingfisher

final class BoutiqueTableViewCell: UITableViewCell {

    private var presenter: BoutiqueItemPresenter?
    
    private lazy var titleTextLabel: UILabel = {
        let titleTextLabel = UILabel()
        titleTextLabel.text = "Hello"
        titleTextLabel.textColor = UIColor.black
        return titleTextLabel
    }()
    
    private let subTitleTextLabel = UILabel()
    
    private lazy var botiqueImageView: UIImageView = {
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
        
        botiqueImageView.image = UIImage(named: "dog2")
        backgroundColor = .white
      
        configureLayout()
    }
    
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
                                    //.processor(processor),
                                       .scaleFactor(UIScreen.main.scale),
                                       .transition(.fade(1)),
                                       .cacheOriginalImage
                                   ])
        
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
