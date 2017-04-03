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
        static let url = "hhttp://www.codetalk.de/"
        static let cars = "cars.json"
    }
    
    struct Map {
        static let apiKey = "AIzaSyDeHKNqbPqk7pl741UUryFI6VYpIq31tZA"
        static let url = "https://maps.googleapis.com/maps/api/place/"
    }
}

struct BVStoryboard {
    static let Main = "Main"
    
    struct View {
        
        struct CarSharing {
            static let Navigation = "NavigationCarSharingVCBoard"
            static let Map = "MapVCBoard"
            static let Cars = "CarsVCBoard"
        }
        
    }
}
