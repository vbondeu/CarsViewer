//
//  Settings.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import Foundation

struct Settings {
    struct Network {
        static let url = "http://www.codetalk.de/"
        static let cars = "cars.json"
    }
    
    struct Map {
        static let apiKey = "AIzaSyCrgXzwVHwBhx5JLNlEVMg2SgT2Jf5RcTU"
    }
}

struct BVStoryboard {
    static let Main = "Main"
    
    struct View {
            static let Navigation = "NavigationCarSharingVCBoard"
            static let Map = "MapVCBoard"
            static let Cars = "CarsVCBoard"
            static let List = "NavigationCarSharingVCList"
    }
}
