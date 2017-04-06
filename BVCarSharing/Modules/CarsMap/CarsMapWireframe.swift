//
//  CarsMapWireframe.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
@testable import BVCarSharing

class CarsMapWireframe: NSObject, CarsMapWireframeProtocol {

    var navigationController : UINavigationController?
    var carsListWireframe : CarsListWireframe?
    var carsMapViewController : CarsMapViewController?
    
    override init() {
        super.init()

        self.navigationController = UIStoryboard(name: BVStoryboard.Main, bundle: nil).instantiateViewController(withIdentifier: BVStoryboard.View.Navigation) as? UINavigationController
        self.carsMapViewController = self.navigationController?.topViewController as? CarsMapViewController
    }
    
    func presentCarsMapViewControllerInWindow(window : UIWindow) {
        window.rootViewController = self.navigationController;
        window.makeKeyAndVisible()
    }
    
    func showCarOnMap(car : Car) {
        self.carsMapViewController?.showCarOnMap(car: car)
    }
}
