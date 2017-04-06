//
//  CarsMapViewController + Map.swift
//  BVCarSharing
//
//  Created by VBond on 4/5/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps
import RealmSwift
@testable import BVCarSharing

extension CarsMapViewController: GMSMapViewDelegate {        
    
    func setupView(car: Car) {
        self.ownerNameLabel.text = car.name
        self.makeLabel.text = car.make
        
        if let imageUrl = car.imageUrl(),
            let url =  URL(string: imageUrl) {
            self.carImageView.af_setImage(withURL: url)
        }
    }
    
    func hideInfoView() {
        self.carsInfoView.isHidden = true
    }
    
    // MARK - Google Maps View Delegate
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let car = marker.userData as? Car {
            self.setupView(car: car)
            self.carsInfoView.isHidden = false
        }
        return true
    }
    
    func showMarkers() {
        var bounds = GMSCoordinateBounds()
        
        for car in self.carsList {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(car.latitude,car.longitude)
            marker.title = car.modelName
            marker.snippet = car.name
            marker.userData = car
            marker.icon = UIImage(named: "markerIcon")
            bounds = bounds.includingCoordinate(marker.position)
            marker.map = self.carsMapView
        }
        
        self.carsMapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 70.0))
        self.carsMapView.reloadInputViews()
    }
    
    func showCarOnMap(car : Car) {
        self.showMarkers()

        var bounds = GMSCoordinateBounds()
        bounds = bounds.includingCoordinate(CLLocationCoordinate2DMake(car.latitude,car.longitude))
        self.carsMapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 100.0))
        self.setupView(car: car)
        self.carsInfoView.isHidden = false
        
        self.carsMapView.reloadInputViews()
        self.carsMapView.layoutSubviews()
    }
}
