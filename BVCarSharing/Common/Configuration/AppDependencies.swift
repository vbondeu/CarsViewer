//
//  AppDependencies.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps

class AppDependencies: NSObject {

    let carsMapWireframe = CarsMapWireframe()
    
    override init() {
        super.init()
        self.configureDependencies()
        self.configureFrameworks()
    }
    
    func configureDependencies() {
        self.carsMapWireframe.carsListWireframe = CarsListWireframe()
        
        guard let carsMapViewController = self.carsMapWireframe.carsMapViewController else {
            return
        }

        let carsMapPresenter = CarsMapPresenter(view: carsMapViewController)
        carsMapPresenter.interactor = CarsMapInteractor(presenter : carsMapPresenter)
        self.carsMapWireframe.carsMapViewController?.presenter = carsMapPresenter
        
        let carsListWireframe = CarsListWireframe()
        
        guard let carsListTableViewController = carsListWireframe.carsListTableViewController else {
            return
        }
        
        let carsListPresenter = CarsListPresenter(view: carsListTableViewController)
        carsListWireframe.carsListTableViewController?.presenter = carsListPresenter
        carsListPresenter.carsMapWireframe = carsMapWireframe
        carsListPresenter.interactor = CarsListInteractor(presenter: carsListPresenter)
        carsMapPresenter.carsListWireframe = carsListWireframe
    }
        
    func configureFrameworks() {
        GMSServices.provideAPIKey(Settings.Map.apiKey)
    }
    
    func installRootViewControllerIntoWindow(window : UIWindow) -> Bool {
        self.carsMapWireframe.presentCarsMapViewControllerInWindow(window: window)
        return true;
    }
    
}
