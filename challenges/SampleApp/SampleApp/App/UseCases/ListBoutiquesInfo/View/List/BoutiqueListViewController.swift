//
//  BoutiqueListViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit
import Alamofire

final class BoutiqueListViewController: UIViewController {

    let presenter: BoutiqueListPresenter
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BoutiqueTableViewCell.self, forCellReuseIdentifier: "BoutiqueTableViewCell")
        return tableView
    }()
    
    
    init(presenter: BoutiqueListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        presenter.view = self
        presenter.viewLayerLoaded()
        configureLayout()
    }
    
    private func configureLayout() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}


//MARK: UITableViewDataSource
extension BoutiqueListViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.numberOfItems()
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let itemPresenter = presenter.item(at: indexPath)
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoutiqueTableViewCell", for: indexPath) as? BoutiqueTableViewCell
    , let presenter =  itemPresenter
          else {
        return UITableViewCell()
    }
   
    cell.configure(with: presenter)
    return cell
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//MARK: UITableViewDelegate
extension BoutiqueListViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
    
}

//MARK: UITableViewDelegate
extension BoutiqueListViewController:  BoutiqueListViewReceiver {
    
    func showErrorMessage(text: String) {
        let alert = UIAlertController(title: "Alert!", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Go to settings", style: UIAlertAction.Style.default, handler: { _ in
            self.presenter.pressedGoToSettings()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func reloadData() {
        tableView.reloadData()
    }
    
}


