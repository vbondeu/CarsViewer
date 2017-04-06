//
//  CarsListPresenterProtocol.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import BVCarSharing

protocol CarsListPresenterProtocol {
    func updateView()
    func updateCarsList()
    func didLoadItems(cars: Results<Car>)
    func errorCarsLoad(error: Error)    
}
