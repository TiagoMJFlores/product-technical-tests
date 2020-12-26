//
//  MapLocationViewController.swift
//  SampleApp
//
//  Created by Tiago Flores on 25/12/2020.
//

import UIKit
import MapKit

final class MapLocationViewController: UIViewController {

    private let presenter: MapLocationDelegate
    
    private lazy var mapView: MKMapView = {
       let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        view.addSubview(mapView)
        return mapView
    }()
    
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
    
    init(presenter: MapLocationPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not using storyboards")
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
       } else if annotation is MKPointAnnotation {
            annotationView.image =  UIImage.bigLocationPin
          return annotationView
       } else {
          return nil
       }
    }
}

// MARK: MapLocationViewReceiver
extension MapLocationViewController: MapLocationViewReceiver {
    func addLocation(location: Location) {
        let pinLocation = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
        setPinUsingMKPointAnnotation(location: pinLocation)
    }
    
    
    func setPinUsingMKPointAnnotation(location: CLLocationCoordinate2D){
       let annotation = MKPointAnnotation()
       annotation.coordinate = location
       let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
       mapView.setRegion(coordinateRegion, animated: true)
       mapView.addAnnotation(annotation)
    }
    
   
    
}
