//
//  BoutiqueItemViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit
import Kingfisher

final class BoutiqueItemViewController: UIViewController {
  
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cell: BoutiqueItemTableViewCell.self)
        return tableView
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
       view.addSubview(imageView)
       imageView.contentMode = .scaleAspectFit
       return imageView
    }()
   
   
    private var presenter: BoutiqueItemPresenterProtocol
    
    init(presenter: BoutiqueItemPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLayerLoaded()
        title = presenter.name
        
        self.view.backgroundColor = UIColor.white
      
        if let imageUrl = presenter.imageUrl {
            downloadImage(from: imageUrl)
        } else {
            imageView.isHidden = true
        }
       
        configureLayout()
    }
    
    private func configureLayout() {
  
        tableView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
             imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            tableView.topAnchor.constraint(equalTo:  imageView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        let bottomVerticalConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomVerticalConstraint.priority = UILayoutPriority(rawValue: 800)
        bottomVerticalConstraint.isActive = true
        
    }
    
   
    private func downloadImage(from imageUrl: String) {
 
        let url = URL(string: imageUrl)
        self.imageView.kf.setImage(with: url,
                                          placeholder: UIImage(named: "placeholder"),
                                   options: [
                                       .scaleFactor(UIScreen.main.scale),
                                       .transition(.fade(1)),
                                       .cacheOriginalImage
                                   ])
        
    }
    
    private func configureStyle() {
        view.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
    }
        
}


//MARK: UITableViewDataSource
extension BoutiqueItemViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfItems()
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(for: BoutiqueItemTableViewCell.self, for: indexPath)
    let cellType = presenter.item(at: indexPath)
    cell.selectionStyle = .none
    cell.configure(with: presenter, type: cellType)
    return cell
  }
    
}

//MARK: UITableViewDelegate
extension BoutiqueItemViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
 
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        if imageView.frame.size.height <= 0 {
            return
        }
        let scale =  1 - abs(scrollView.contentOffset.y)  / scrollView.frame.size.height
        view.setNeedsLayout()
        self.imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }
}


//MARK: BoutiqueItemViewReceiver
extension BoutiqueItemViewController: BoutiqueItemViewReceiver {
    
    func reloadData() {
        tableView.reloadData()
    }
}
