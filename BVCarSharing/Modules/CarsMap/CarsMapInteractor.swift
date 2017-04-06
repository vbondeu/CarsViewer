//
//  CarsMapInteractor.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
@testable import BVCarSharing

class CarsMapInteractor: NSObject, CarsMapInteractorProtocol {

    weak var presenter : CarsMapPresenter?
    
    init (presenter : CarsMapPresenter) {
        self.presenter = presenter        
    }
    
    func loadCars() {
        let carsList = DBManager.sharedInstance.getObjects(objectClass: Car.self).sorted(byKeyPath: "name", ascending: true)
        self.presenter?.didLoadItems(cars: carsList)
        
        HTTPManager.API().requestCars(success: { [unowned self] (response) in
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
