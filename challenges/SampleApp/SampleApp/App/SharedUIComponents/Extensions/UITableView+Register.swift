//
//  UITableView+Register.swift
//  SampleApp
//
//  Created by Tiago Flores on 26/12/2020.
//

import UIKit

public extension UITableView {
   
    private func reuseIndentifier<T>(for type: T.Type) -> String {
            return String(describing: type)
        }
    
    func register<T: UITableViewCell>(cell: T.Type) {
           register(T.self, forCellReuseIdentifier: reuseIndentifier(for: cell))
       }
    
    func dequeueReusableCell<T: UITableViewCell>(for type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell.")
        }

        return cell
    }
}
