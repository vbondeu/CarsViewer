//
//  Car.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import RealmSwift

class Car: Object {
    dynamic var carId : String?
    dynamic var modelIdentifier: String?
    dynamic var modelName: String?
    dynamic var name: String?
    dynamic var make: String?
    dynamic var color: String?
    dynamic var series: String?
    dynamic var fuelType: String?
    dynamic var licensePlate: String? //enum
    dynamic var innerCleanliness: String?
    dynamic var carImageUrl: String?

    dynamic var fuelLevel: Double = 0.0
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    
    convenience init(name : String) {
        self.init()
        self.name = name
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
}
