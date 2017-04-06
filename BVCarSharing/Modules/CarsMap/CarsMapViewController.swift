//
//  CarsMapViewController.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import GoogleMaps
@testable import BVCarSharing

class CarsMapViewController: UIViewController, CarsMapViewControllerProtocol {

    @IBOutlet var carsMapView: GMSMapView!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var makeLabel: UILabel!
    @IBOutlet var carsInfoView: UIView!
    @IBOutlet var carImageView: UIImageView!
    
    var presenter : CarsMapPresenter?
    var carsList : Results<Car>!
    var notificationToken: NotificationToken? = nil
    
    // MARK: - UI Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureView()
        self.refreshData()
        self.addRealmNotifications()
    }

    func configureView() {
        self.carsInfoView.isHidden = true
        self.carsMapView.delegate = self
        self.carsMapView.isMyLocationEnabled = true
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(hideInfoView))
        swipeDown.direction = .down
        self.carsInfoView.addGestureRecognizer(swipeDown)
    }
    
    // MARK: - CarsMapViewControllerProtocol
    
    func showData(cars: Results<Car>) {
        self.carsList = cars
        self.reloadEntries()
    }
    
    func reloadEntries() {
        self.carsMapView.clear()
        self.showMarkers()
    }
    
    func showConnectionError(error: Error) {
        self.present(AlertController.okDialog(title: error.localizedDescription), animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func refreshData() {
        self.presenter?.updateView()
    }
    
    @IBAction func tapOpenCarsList(_ sender: Any) {
        self.presenter?.presentCarsListViewController()
    }
    
    // Realm - Notifications
    
    func addRealmNotifications() {
        self.notificationToken = carsList.addNotificationBlock {
            [unowned self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                fallthrough
            case .update:
                self.reloadEntries()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
}
