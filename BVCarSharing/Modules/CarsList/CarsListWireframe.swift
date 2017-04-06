//
//  CarsListWireframe.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit
import Foundation

class CarsListWireframe: NSObject, CarsListWireframeProtocol {

    var navigationController : UINavigationController?
    var carsListTableViewController : CarsListTableViewController?
    var presenter : CarsListPresenter?
    
    override init() {
        super.init()
        
        self.navigationController = UIStoryboard(name: BVStoryboard.Main, bundle: nil).instantiateViewController(withIdentifier: BVStoryboard.View.List) as? UINavigationController
        self.carsListTableViewController = self.navigationController?.topViewController as? CarsListTableViewController
    }
}
