//
//  CarsMapPresenter.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

class CarsMapPresenter: NSObject {
    
    weak var interface : CarsMapViewController?
    var interactor : CarsMapInteractor?
    var carsListWireframe : CarsListWireframe?
    
    init(view : CarsMapViewController) {
        self.interface = view
    }
    
    func presentCarsListViewController() {
        if let controller = self.carsListWireframe?.navigationController {
            self.interface?.present(controller, animated: true, completion: nil)
        }
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
