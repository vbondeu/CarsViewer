//
//  Car.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import ObjectMapper

protocol CarMeta {
    func imageUrl() -> String?
}

public class Car: Object, Mappable, CarMeta {
    
    dynamic var carId : String?
    dynamic var modelIdentifier: String?
    dynamic var modelName: String?
    dynamic var name: String?
    dynamic var make: String?
    dynamic var color: String?
    dynamic var series: String?
    dynamic var fuelType: String?
    dynamic var licensePlate: String?
    dynamic var innerCleanliness: String?
    dynamic var carImageUrl: String?

    dynamic var fuelLevel: Double = 0.0
    dynamic var latitude: Double = 0.0
    dynamic var longitude: Double = 0.0
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        carId    <- map["id"]
        modelIdentifier <- map["modelIdentifier"]
        modelName <- map["modelName"]
        name <- map["name"]
        make <- map["make"]
        color <- map["color"]
        series <- map["series"]
        fuelType <- map["fuelType"]
        licensePlate <- map["licensePlate"]
        innerCleanliness <- map["innerCleanliness"]
        carImageUrl <- map["carImageUrl"]
        fuelLevel <- map["fuelLevel"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    
    func imageUrl() -> String? {
        if let modelIdentifier = self.modelIdentifier,
            let color = self.color {
            return "https://prod.drive-now-content.com/fileadmin/user_upload_global/assets/cars/\(modelIdentifier)/\(color)/2x/car.png"
        }
        return self.carImageUrl
    }
    
    override public static func primaryKey() -> String {
        return "carId"
    }
}
