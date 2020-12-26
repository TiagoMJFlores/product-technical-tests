//
//  MapLocationPresenterProtocols.swift
//  SampleApp
//
//  Created by Tiago Flores on 26/12/2020.
//

import Foundation

protocol MapLocationDelegate {
    func viewLayerLoaded()
}

protocol MapLocationDataSource {
    var mapItemInFocusId: String { get}
}
