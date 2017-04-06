//
//  CarTableViewCell.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation
import AlamofireImage
@testable import BVCarSharing

class CarTableViewCell: UITableViewCell {

    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var makeLabel: UILabel!
    @IBOutlet var carImageView: UIImageView!
    @IBOutlet var seriesLabel: UILabel!
    @IBOutlet var carsIdLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var fuelLabel: UILabel!
    
    var car : Car? {
        didSet {
            if let unwrCar = car {
                self.setupCell(car: unwrCar)
            }
        }
    }

    func setupCell(car: Car) {
        self.ownerNameLabel.text = car.name
        self.makeLabel.text = car.make
        self.seriesLabel.text = car.series
        self.carsIdLabel.text = car.carId
        self.colorLabel.text = car.color
        self.fuelLabel.text = car.fuelType
        
        if let fuelLevel = String(car.fuelLevel) as? String {
            self.fuelLabel.text = self.fuelLabel.text! + "  fuel level: " + fuelLevel
        }
            
        if let imageUrl = car.imageUrl(),
            let url =  URL(string: imageUrl) {
            self.carImageView.af_setImage(withURL: url)
        }
    }

}
