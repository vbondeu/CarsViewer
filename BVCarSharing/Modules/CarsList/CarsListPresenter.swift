//
//  CarsListPresenter.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import BVCarSharing

class CarsListPresenter: NSObject, CarsListPresenterProtocol {

    weak var interface : CarsListTableViewController?
    weak var carsMapWireframe : CarsMapWireframe?
    var interactor : CarsListInteractor?
    
    init(view : CarsListTableViewController) {
        self.interface = view
    }
    
    func updateView() {
        self.interactor?.loadCars()
    }
    
    func updateCarsList() {
        self.interface?.reloadEntries()
    }
    
    func didLoadItems(cars: Results<Car>) {
        self.interface?.showData(cars: cars)
    }
    
    func errorCarsLoad(error: Error) {
        self.interface?.showConnectionError(error: error)
    }
}
