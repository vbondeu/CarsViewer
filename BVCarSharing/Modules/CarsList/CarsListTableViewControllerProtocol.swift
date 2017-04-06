//
//  CarsListTableViewControllerProtocol.swift
//  BVCarSharing
//
//  Created by VBond on 4/5/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

protocol CarsListTableViewControllerProtocol {
    func reloadEntries()
    func showConnectionError(error: Error)
    func showData(cars: Results<Car>)
}
