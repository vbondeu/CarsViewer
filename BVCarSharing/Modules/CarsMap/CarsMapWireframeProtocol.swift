//
//  CarsMapWireframeProtocol.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
@testable import BVCarSharing

protocol CarsMapWireframeProtocol {
    func presentCarsMapViewControllerInWindow(window : UIWindow)
    func showCarOnMap(car : Car)
}

