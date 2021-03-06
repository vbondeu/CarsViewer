//
//  CarsMapPresenterProtocol.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

protocol CarsMapPresenterProtocol {
    func presentCarsListViewController()
    func updateView()
    func updateCarsList()
    func didLoadItems(cars: Results<Car>)
    func errorCarsLoad(error: Error)
}
