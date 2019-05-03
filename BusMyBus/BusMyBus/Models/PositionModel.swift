//
//  PositionModel.swift
//  BusMyBus
//
//  Created by Nguyen Tran Cong on 5/3/19.
//  Copyright © 2019 nguyentran. All rights reserved.
//

import Foundation
import UIKit

class PositionModel {
    var name: String
    var coordinate: CoordinateModel?
    
    init(name: String, coordinate: CoordinateModel? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

class CoordinateModel {
    var lat: String
    var lon: String
    
    init(lat: String, lon: String) {
        self.lat = lat
        self.lon = lon
    }
}

class BusModel {
    var id: String!
    var name: String
    var arrival: String
    var leave: String
    var PositionModels = [PositionModel]()
    
     init(name: String, arrival: String, leave: String, data: [PositionModel]? = nil) {
        id = UUID().uuidString
        self.name = name
        self.arrival = arrival
        self.leave = leave
        
        if let data = data {
            self.PositionModels = data
        }
    }
}
