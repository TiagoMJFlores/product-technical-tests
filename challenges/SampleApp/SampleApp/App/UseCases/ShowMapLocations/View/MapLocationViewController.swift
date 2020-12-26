//
//  MapLocationViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit
import MapKit

final class MapLocationViewController: UIViewController {

    private let presenter: MapItemPresenterProtocol
    
    private lazy var mapView: MKMapView = {
       let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        view.addSubview(mapView)
        return mapView
    }()
    
    init(presenter: MapItemPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        presenter.viewLayerLoaded()
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
}


// MARK: MKMapViewDelegate
extension MapLocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    
       let Identifier = "Pin"
       let annotationView =  mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
     
       annotationView.canShowCallout = true
       if annotation is MKUserLocation {
          return nil
       } else if let annotation = annotation as? MapAnnotation {

            if annotation.id == presenter.mapItemInFocusId {
                annotationView.image =  UIImage.bigLocationPin
            } else {
                annotationView.image =  UIImage.locationPin
            }
      
          return annotationView
       } else {
          return nil
       }
    }
}

// MARK: MapLocationViewReceiver
extension MapLocationViewController: MapLocationViewReceiver {
    
    func addLocation(mapAnnotation: MapAnnotation) {
        let coordinateRegion = MKCoordinateRegion(center: mapAnnotation.coordinate, latitudinalMeters: 2500, longitudinalMeters: 2500)
        mapView.setRegion(coordinateRegion, animated: true)
        setPinUsingMKPointAnnotation(pin: mapAnnotation)
    }
    
    func addLocations(mapAnnotations: [MapAnnotation]) {
        mapView.addAnnotations(mapAnnotations)
    }
    
    func setPinUsingMKPointAnnotation(pin: MapAnnotation){
       mapView.addAnnotation(pin)
    }
    
   
    
}
