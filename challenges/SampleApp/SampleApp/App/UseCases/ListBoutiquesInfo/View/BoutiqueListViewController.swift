//
//  BoutiqueListViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import UIKit

final class BoutiqueListViewController: UIViewController {

    let presenter = BoutiqueListPresenter()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
      
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BoutiqueTableViewCell.self, forCellReuseIdentifier: "BoutiqueTableViewCell")
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView.reloadData()
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
    return 5
  }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoutiqueTableViewCell", for: indexPath) as? BoutiqueTableViewCell else {
        return UITableViewCell()
    }
    cell.textLabel?.text = "test"
    return cell
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//MARK: UITableViewDelegate
extension BoutiqueListViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = BoutiqueItemViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

