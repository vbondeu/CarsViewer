//
//  CarsMapViewControllerProtocol.swift
//  BVCarSharing
//
//  Created by VBond on 4/5/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

protocol CarsMapViewControllerProtocol {
    func reloadEntries()
    func showConnectionError(error: Error)
    func showData(cars: Results<Car>)
    func showCarOnMap(car : Car)
}
