//
//  CarsListInteractor.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

class CarsListInteractor: NSObject, CarsListInteractorProtocol {
    
    weak var presenter : CarsListPresenter?
    
    init (presenter : CarsListPresenter) {
        self.presenter = presenter
    }
    
    func loadCars() {
        let carsList = DBManager.sharedInstance.getObjects(objectClass: Car.self).sorted(byKeyPath: "name", ascending: true)
        self.presenter?.didLoadItems(cars: carsList)
        
        HTTPManager.API().requestCars(success: { (response) in
                guard let cars = response.object as? [Car] else {
                    return
                }
            
                for car in cars {
                    DBManager.sharedInstance.insertOrUpdate(object: car)
                }                        
            }, failure: { [unowned self] (response) in
                if let error = response.error {
                    self.presenter?.errorCarsLoad(error: error)
                }
        })
    }
}
