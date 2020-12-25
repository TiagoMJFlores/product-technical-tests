//
//  MapLocationViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit
import MapKit

final class MapLocationViewController: UIViewController {

    private let presenter: MapLocationPresenter
    
    private lazy var mapView: MKMapView = {
       let mapView = MKMapView()
        mapView.showsUserLocation = true
        view.addSubview(mapView)
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    

    private func configureLayout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
       
        mapView.showsUserLocation = true
    }
    
    init(presenter: MapLocationPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }

}
