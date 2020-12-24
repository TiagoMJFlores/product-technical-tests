//
//  BoutiqueListViewReceiver.swift
//  SampleApp
//
//  Created by Tiago Flores on 23/12/2020.
//

import Foundation

protocol BoutiqueListViewReceiver: class {
    func reloadData()
    func showErrorMessage(text: String)
}